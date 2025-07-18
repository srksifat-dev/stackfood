import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/app/router/app_router.dart';
import 'package:stackfood/src/core/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:stackfood/src/core/di/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppMetaDataCubit>(
          create: (context) => sl.get<AppMetaDataCubit>(),
        ),
      ],
      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}
