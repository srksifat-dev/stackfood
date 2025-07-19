import 'package:flutter/material.dart';
import 'package:stackfood/src/core/app/app.dart';
import 'package:stackfood/src/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}
