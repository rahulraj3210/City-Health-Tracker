import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/view/pages/dashboard_page.dart';
import '../../features/health_map/view/pages/block_detail_page.dart';

part 'app_router.gr.dart';

/// Central route table. Paths are explicit so deep links work on the web
/// (e.g. `/blocks/B-12`) as well as on Android.
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page, path: '/', initial: true),
    AutoRoute(page: BlockDetailRoute.page, path: '/blocks/:blockId'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
