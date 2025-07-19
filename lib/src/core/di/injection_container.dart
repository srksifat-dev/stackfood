import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stackfood/src/core/api/src/api_client.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/constants/api_endpoints.dart';
import 'package:stackfood/src/core/services/cache_service.dart';
import 'package:stackfood/src/features/home/data/datasources/home_datasource.dart';
import 'package:stackfood/src/features/home/data/datasources/home_datasource_impl.dart';
import 'package:stackfood/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_banner_usecase.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_category_usecase.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_food_campaign_usecase.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_popular_food_usecase.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_restaurant_usecase.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_banner_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_category_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_food_campaign_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_popular_food_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_restaurant_bloc.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_food_campaign.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';
part 'usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Datasource
  await _initDataSources();

  // Repository
  await _initRepositories();

  // Bloc
  await _initBlocs();

  // Usecase
  await _initUsecase();
}
