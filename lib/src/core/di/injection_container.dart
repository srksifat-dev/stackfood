import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stackfood/src/core/api/src/api_client.dart';
import 'package:stackfood/src/core/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';
part 'usecase.dart';

final sl = GetIt.instance;

class ServiceProvider {
  static Future<void> init() async {
    /// Datasource
    await _initDataSources();

    /// Repository
    await _initRepositories();

    /// Bloc
    await _initBlocs();
  }
}
