import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'health_map/blocs/city_health_cubit.dart';
import 'health_map/blocs/house_status_cubit.dart';
import 'health_map/service/city_health_service.dart';
import 'health_map/service/firestore_city_health_service.dart';

class CityHealthApp extends StatefulWidget {
  const CityHealthApp({super.key});

  @override
  State<CityHealthApp> createState() => _CityHealthAppState();
}

class _CityHealthAppState extends State<CityHealthApp> {
  final _router = AppRouter();

  // Composition root: the service is handed straight to the cubits and is
  // deliberately not put in the widget tree, so views can only reach data
  // through a cubit.
  final CityHealthService _service = FirestoreCityHealthService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CityHealthCubit(_service)..watchCity()),
        BlocProvider(create: (_) => HouseStatusCubit(_service)),
      ],
      child: MaterialApp.router(
        title: 'City Health Tracker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: _router.config(),
      ),
    );
  }
}
