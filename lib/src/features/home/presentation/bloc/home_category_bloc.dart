import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_category_usecase.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeEvent, HomeCategoryState> {
  final GetHomeCategoryUsecase getHomeCategoryUsecase;

  HomeCategoryBloc({required this.getHomeCategoryUsecase})
    : super(GetHomeCategoryLoading()) {
    on<GetHomeCategoryEvent>(onGetHomeCategory);
  }

  void onGetHomeCategory(
    GetHomeCategoryEvent event,
    Emitter<HomeCategoryState> emit,
  ) async {
    try {
      final dataState = await getHomeCategoryUsecase();

      dataState.fold(
        (failure) => emit(GetHomeCategoryError()),
        (categories) => emit(GetHomeCategoryDone(homeCategories: categories)),
      );
    } on DioException catch (e) {
      emit(GetHomeCategoryError(error: e));
    }
  }
}
