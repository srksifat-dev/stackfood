import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/base/bloc/global_bloc_providers.dart';
import 'package:stackfood/src/core/app/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalBlocProviders.providers,
      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}
