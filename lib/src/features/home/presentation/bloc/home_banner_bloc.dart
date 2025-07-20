import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_banner_usecase.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_banner_state.dart';

/// BLoC responsible for managing the state of home banners.
class HomeBannerBloc extends Bloc<HomeEvent, HomeBannerState> {
  final GetHomeBannerUsecase getHomeBannerUsecase;

  HomeBannerBloc({required this.getHomeBannerUsecase})
    : super(GetHomeBannerLoading()) {
    on<GetHomeBannerEvent>(onGetHomeBanner);
  }

  void onGetHomeBanner(
    GetHomeBannerEvent event,
    Emitter<HomeBannerState> emit,
  ) async {
    try {
      final dataState = await getHomeBannerUsecase();

      dataState.fold(
        (failure) => emit(GetHomeBannerError()),
        (banners) => emit(GetHomeBannerDone(homeBanners: banners)),
      );
    } on DioException catch (e) {
      emit(GetHomeBannerError(error: e));
    }
  }
}
