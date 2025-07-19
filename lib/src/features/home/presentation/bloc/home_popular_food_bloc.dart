import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_popular_food_response_model.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_popular_food_usecase.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_popular_food_state.dart';

// home_popular_food_bloc.dart
class HomePopularFoodBloc extends Bloc<HomeEvent, HomePopularFoodState> {
  final GetHomePopularFoodUsecase getHomePopularFoodUsecase;

  HomePopularFoodBloc({required this.getHomePopularFoodUsecase})
    : super(GetHomePopularFoodLoading()) {
    on<GetHomePopularFoodEvent>(onGetHomePopularFood);
  }

  Future<void> onGetHomePopularFood(
    GetHomePopularFoodEvent event,
    Emitter<HomePopularFoodState> emit,
  ) async {
    try {
      final current = state is GetHomePopularFoodDone
          ? (state as GetHomePopularFoodDone)
          : null;

      // Show loading indicator at the end of the list
      if (!event.isFirstPage && current != null) {
        emit(current.copyWith(isLoadingMore: true));
      }

      final dataState = await getHomePopularFoodUsecase(params: event.params);

      dataState.fold((failure) => emit(GetHomePopularFoodError()), (foods) {
        final totalLoaded = event.isFirstPage
            ? foods.products.length
            : current!.homePopularFoods!.length + foods.products.length;

        final hasReachedMax = totalLoaded + 10 >= foods.totalSize;
        final newList = event.isFirstPage
            ? foods.products.map((p) => p.toEntity()).toList()
            : [
                ...current!.homePopularFoods!,
                ...foods.products.map((p) => p.toEntity()),
              ];

        emit(
          GetHomePopularFoodDone(
            homePopularFoods: newList,
            hasReachedMax: hasReachedMax,
            isLoadingMore: false,
          ),
        );
      });
    } on DioException catch (e) {
      emit(GetHomePopularFoodError(error: e));
    }
  }
}
