// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BlockDetailPage]
class BlockDetailRoute extends PageRouteInfo<BlockDetailRouteArgs> {
  BlockDetailRoute({
    required String blockId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         BlockDetailRoute.name,
         args: BlockDetailRouteArgs(blockId: blockId, key: key),
         rawPathParams: {'blockId': blockId},
         initialChildren: children,
       );

  static const String name = 'BlockDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BlockDetailRouteArgs>(
        orElse: () =>
            BlockDetailRouteArgs(blockId: pathParams.getString('blockId')),
      );
      return BlockDetailPage(blockId: args.blockId, key: args.key);
    },
  );
}

class BlockDetailRouteArgs {
  const BlockDetailRouteArgs({required this.blockId, this.key});

  final String blockId;

  final Key? key;

  @override
  String toString() {
    return 'BlockDetailRouteArgs{blockId: $blockId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BlockDetailRouteArgs) return false;
    return blockId == other.blockId && key == other.key;
  }

  @override
  int get hashCode => blockId.hashCode ^ key.hashCode;
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}
