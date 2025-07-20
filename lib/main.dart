import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/app/app.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(
    BlocProvider(
      create: (context) => GlobalRefreshCubit(),
      child: const MyApp(),
    ),
  );
}
