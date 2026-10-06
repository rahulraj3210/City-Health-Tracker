// Seeds Firestore with the deterministic mock city from MockCityGenerator.
//
// Usage (from the project root):
//   fvm dart run tool/seed_firestore.dart [--project <id>] [--seed <n>] [--dry-run]
//
// Auth: uses $FIREBASE_ACCESS_TOKEN if set, otherwise the access token cached
// by the Firebase CLI (`firebase login`). Writes go through the Firestore REST
// API as your Google account, so they bypass the client security rules
// (which only let clients change a house's status). Re-running is idempotent:
// the same seed overwrites the same documents and prunes any others.
//
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:city_health_tracker/core/constants/firestore_paths.dart';
import 'package:city_health_tracker/health_map/service/mock_city_generator.dart';

const _defaultProject = 'city-health-tracker-5843';
const _batchLimit = 450; // Firestore batchWrite caps at 500 writes.

Future<void> main(List<String> args) async {
  final project = _arg(args, '--project') ?? _defaultProject;
  final seed = int.parse(_arg(args, '--seed') ?? '42');
  final dryRun = args.contains('--dry-run');

  final blocks = MockCityGenerator(seed: seed).generate();
  final root = 'projects/$project/databases/(default)/documents';

  final writes = <Map<String, Object?>>[];
  for (final block in blocks) {
    writes.add(
      _write(
        '$root/${FirestorePaths.blocks}/${block.id}',
        block.toJson()..remove('id'),
      ),
    );
    for (final house in block.houses) {
      writes.add(
        _write(
          '$root/${FirestorePaths.blocks}/${block.id}/${FirestorePaths.houses}/${house.id}',
          // id and blockId are derived from the document path when reading.
          house.toJson()
            ..remove('id')
            ..remove('blockId'),
        ),
      );
    }
  }

  final houseCount = writes.length - blocks.length;
  print('Generated ${blocks.length} blocks / $houseCount houses (seed $seed).');
  if (dryRun) {
    print(const JsonEncoder.withIndent('  ').convert(writes.take(2).toList()));
    return;
  }

  final token = await _accessToken();
  final client = HttpClient();
  final api =
      'https://firestore.googleapis.com/v1/projects/$project/databases/(default)/documents';
  try {
    // Prune documents the new city doesn't contain (e.g. a block that shrank
    // from 5x5 to 4x4 houses), so re-seeding never leaves orphans behind.
    final wanted = {for (final w in writes) (w['update'] as Map)['name']};
    final existing = {
      ...await _docNames(client, token, api, FirestorePaths.blocks, false),
      ...await _docNames(client, token, api, FirestorePaths.houses, true),
    };
    final stale = existing.difference(wanted);
    writes.addAll([
      for (final name in stale) {'delete': name},
    ]);
    print('Pruning ${stale.length} stale documents.');

    for (var i = 0; i < writes.length; i += _batchLimit) {
      final chunk = writes.sublist(
        i,
        (i + _batchLimit).clamp(0, writes.length),
      );
      final body = await _post(client, token, '$api:batchWrite', {
        'writes': chunk,
      });
      final failed = ((body as Map)['status'] as List)
          .where((s) => (s as Map)['code'] != null && s['code'] != 0)
          .length;
      if (failed > 0) {
        stderr.writeln('$failed writes failed in batch starting at $i: $body');
        exit(1);
      }
      print('  wrote ${i + chunk.length}/${writes.length}');
    }
    print('Seeded project $project.');
  } finally {
    client.close();
  }
}

/// Full resource names of every document in [collectionId] (at the root, or
/// anywhere when [allDescendants]), fetching names only.
Future<Set<String>> _docNames(
  HttpClient client,
  String token,
  String api,
  String collectionId,
  bool allDescendants,
) async {
  final rows = await _post(client, token, '$api:runQuery', {
    'structuredQuery': {
      'from': [
        {'collectionId': collectionId, 'allDescendants': allDescendants},
      ],
      'select': {
        'fields': [
          {'fieldPath': '__name__'},
        ],
      },
    },
  });
  return {
    for (final row in rows as List)
      if ((row as Map)['document'] != null)
        (row['document'] as Map)['name'] as String,
  };
}

Future<Object?> _post(
  HttpClient client,
  String token,
  String url,
  Map<String, Object?> payload,
) async {
  final request = await client.postUrl(Uri.parse(url))
    ..headers.set(HttpHeaders.authorizationHeader, 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(jsonEncode(payload));
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  if (response.statusCode != 200) {
    stderr.writeln('POST $url failed (${response.statusCode}): $body');
    exit(1);
  }
  return jsonDecode(body);
}

Map<String, Object?> _write(String name, Map<String, dynamic> json) => {
  'update': {'name': name, 'fields': _fields(json)},
};

Map<String, Object?> _fields(Map<String, dynamic> json) =>
    json.map((key, value) => MapEntry(key, _value(value, key)));

/// Encodes JSON into Firestore REST `Value`s. ISO strings in `*At` fields
/// become real timestamps so they can be ordered/queried server-side.
Map<String, Object?> _value(Object? value, [String key = '']) =>
    switch (value) {
      null => {'nullValue': null},
      final bool b => {'booleanValue': b},
      final int n => {'integerValue': '$n'},
      final double d => {'doubleValue': d},
      final String s when key.endsWith('At') && DateTime.tryParse(s) != null =>
        {'timestampValue': DateTime.parse(s).toUtc().toIso8601String()},
      final String s => {'stringValue': s},
      final Map<String, dynamic> m => {
        'mapValue': {'fields': _fields(m)},
      },
      final List l => {
        'arrayValue': {'values': l.map((v) => _value(v)).toList()},
      },
      _ => throw ArgumentError('Unsupported value for "$key": $value'),
    };

Future<String> _accessToken() async {
  final fromEnv = Platform.environment['FIREBASE_ACCESS_TOKEN'];
  if (fromEnv != null && fromEnv.isNotEmpty) return fromEnv;

  final home =
      Platform.environment['USERPROFILE'] ?? Platform.environment['HOME'];
  final file = File('$home/.config/configstore/firebase-tools.json');
  if (!file.existsSync()) {
    throw StateError(
      'No Firebase CLI credentials found. Run `firebase login`.',
    );
  }
  final tokens =
      (jsonDecode(await file.readAsString()) as Map)['tokens'] as Map?;
  final expiresAt = tokens?['expires_at'] as int?;
  if (tokens == null ||
      expiresAt == null ||
      DateTime.fromMillisecondsSinceEpoch(expiresAt).isBefore(DateTime.now())) {
    throw StateError(
      'Firebase CLI token missing or expired. Run any '
      '`firebase` command (e.g. `firebase projects:list`) to refresh it, '
      'or set FIREBASE_ACCESS_TOKEN.',
    );
  }
  return tokens['access_token'] as String;
}

String? _arg(List<String> args, String name) {
  final i = args.indexOf(name);
  return i >= 0 && i + 1 < args.length ? args[i + 1] : null;
}
