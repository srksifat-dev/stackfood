import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stackfood/src/features/home/domain/entities/home_banner_entity.dart';

abstract class HomeBannerState extends Equatable {
  HomeBannerState();

  @override
  List<Object?> get props => [];
}

class GetHomeBannerLoading extends HomeBannerState {}

class GetHomeBannerDone extends HomeBannerState {
  final List<HomeBannerEntity>? homeBanners;
  GetHomeBannerDone({this.homeBanners});
}

class GetHomeBannerError extends HomeBannerState {
  final DioException? error;
  GetHomeBannerError({this.error});
}
