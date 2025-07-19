import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';

abstract class HomeCategoryState extends Equatable {
  HomeCategoryState();

  @override
  List<Object?> get props => [];
}

class GetHomeCategoryLoading extends HomeCategoryState {}

class GetHomeCategoryDone extends HomeCategoryState {
  final List<HomeCategoryEntity>? homeCategories;
  GetHomeCategoryDone({this.homeCategories});
}

class GetHomeCategoryError extends HomeCategoryState {
  final DioException? error;
  GetHomeCategoryError({this.error});
}
