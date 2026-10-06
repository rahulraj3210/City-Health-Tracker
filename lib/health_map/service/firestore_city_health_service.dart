import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../models/models.dart';
import 'city_health_service.dart';

/// Firestore-backed [CityHealthService]. This is the only place in the app
/// that talks to Firestore.
class FirestoreCityHealthService implements CityHealthService {
  FirestoreCityHealthService({FirebaseFirestore? firestore})
    : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _blocks =>
      _db.collection(FirestorePaths.blocks);

  Query<Map<String, dynamic>> get _allHouses =>
      _db.collectionGroup(FirestorePaths.houses);

  /// Combines the `blocks` collection with a `houses` collection-group query
  /// so the whole city costs two listeners regardless of block count.
  @override
  Stream<List<CityBlock>> watchCity() {
    StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? blocksSub;
    StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? housesSub;
    List<CityBlock>? latestBlocks;
    List<House>? latestHouses;

    late final StreamController<List<CityBlock>> controller;

    void emitIfReady() {
      final blocks = latestBlocks;
      final houses = latestHouses;
      if (blocks == null || houses == null) return;

      final housesByBlock = <String, List<House>>{};
      for (final house in houses) {
        (housesByBlock[house.blockId] ??= []).add(house);
      }
      controller.add([
        for (final block in blocks)
          block.copyWith(houses: housesByBlock[block.id] ?? const []),
      ]);
    }

    void onError(Object error, StackTrace stackTrace) {
      controller.addError(_mapError(error), stackTrace);
    }

    controller = StreamController<List<CityBlock>>(
      onListen: () {
        blocksSub = _blocks.snapshots().listen((snapshot) {
          try {
            latestBlocks = snapshot.docs.map(_blockFromDoc).toList();
            emitIfReady();
          } catch (e, st) {
            onError(e, st);
          }
        }, onError: onError);
        housesSub = _allHouses.snapshots().listen((snapshot) {
          try {
            latestHouses = snapshot.docs.map(_houseFromDoc).toList();
            emitIfReady();
          } catch (e, st) {
            onError(e, st);
          }
        }, onError: onError);
      },
      onCancel: () async {
        await blocksSub?.cancel();
        await housesSub?.cancel();
      },
    );

    return controller.stream;
  }

  /// Writes only `status` and a server-stamped `updatedAt` — the exact shape
  /// the Firestore rules accept from unauthenticated clients.
  @override
  Future<void> updateHouseStatus({
    required String blockId,
    required String houseId,
    required HealthStatus status,
  }) async {
    final doc = _blocks
        .doc(blockId)
        .collection(FirestorePaths.houses)
        .doc(houseId);
    try {
      await doc
          .update({
            'status': _toFirestore(status.toJson()),
            'updatedAt': FieldValue.serverTimestamp(),
          })
          .timeout(writeTimeout);
    } on TimeoutException catch (e) {
      throw CityHealthServiceException(
        'No response from the server yet. The change is queued and will '
        'sync when the connection returns.',
        cause: e,
      );
    } catch (e) {
      throw _mapWriteError(e);
    }
  }

  /// How long to wait for the server to acknowledge a write.
  static const writeTimeout = Duration(seconds: 15);

  CityBlock _blockFromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      CityBlock.fromJson({..._normalize(doc.data()!), 'id': doc.id});

  House _houseFromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      House.fromJson({
        ..._normalize(doc.data()!),
        'id': doc.id,
        // The parent path is the source of truth for block membership.
        'blockId': doc.reference.parent.parent!.id,
      });

  /// Converts Firestore-specific values (Timestamps) into the plain JSON the
  /// freezed models expect.
  static Map<String, dynamic> _normalize(Map<String, dynamic> data) =>
      data.map((key, value) => MapEntry(key, _normalizeValue(value)));

  static Object? _normalizeValue(Object? value) => switch (value) {
    Timestamp() => value.toDate().toUtc().toIso8601String(),
    Map<String, dynamic>() => _normalize(value),
    List() => value.map(_normalizeValue).toList(),
    _ => value,
  };

  /// Inverse of [_normalize]: ISO strings in `*At` fields become Timestamps
  /// (the rules type-check them).
  static Map<String, dynamic> _toFirestore(Map<String, dynamic> json) =>
      json.map((key, value) => MapEntry(key, _toFirestoreValue(key, value)));

  static Object? _toFirestoreValue(String key, Object? value) =>
      switch (value) {
        final String s
            when key.endsWith('At') && DateTime.tryParse(s) != null =>
          Timestamp.fromDate(DateTime.parse(s)),
        final Map<String, dynamic> m => _toFirestore(m),
        _ => value,
      };

  static CityHealthServiceException _mapWriteError(Object error) {
    if (error is CityHealthServiceException) return error;
    final message = switch (error) {
      FirebaseException(code: 'permission-denied') =>
        'The server rejected this change.',
      FirebaseException(code: 'not-found') => 'This house no longer exists.',
      FirebaseException(code: 'unavailable') =>
        'The health data service is unreachable. Check your connection.',
      FirebaseException(:final code) => 'Could not save the change ($code).',
      _ => 'Could not save the change.',
    };
    return CityHealthServiceException(message, cause: error);
  }

  static CityHealthServiceException _mapError(Object error) {
    if (error is CityHealthServiceException) return error;
    if (error is FirebaseException) {
      final message = switch (error.code) {
        'permission-denied' =>
          'You do not have permission to view city health data.',
        'unavailable' =>
          'The health data service is unreachable. Check your connection.',
        _ => 'Could not load city health data (${error.code}).',
      };
      return CityHealthServiceException(message, cause: error);
    }
    return CityHealthServiceException(
      'City health data is malformed or could not be read.',
      cause: error,
    );
  }
}
