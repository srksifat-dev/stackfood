import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_restaurant_response_model.dart';
import 'package:stackfood/src/features/home/domain/entities/home_restaurant_entity.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_restaurant_usecase.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_restaurant_state.dart';

class HomeRestaurantBloc extends Bloc<HomeEvent, HomeRestaurantState> {
  final GetHomeRestaurantUsecase getHomeRestaurantUsecase;

  HomeRestaurantBloc({required this.getHomeRestaurantUsecase})
    : super(const GetHomeRestaurantLoading()) {
    on<GetHomeRestaurantEvent>(onGetHomeRestaurant);
  }

  Future<void> onGetHomeRestaurant(
    GetHomeRestaurantEvent event,
    Emitter<HomeRestaurantState> emit,
  ) async {
    try {
      final current = state is GetHomeRestaurantDone
          ? (state as GetHomeRestaurantDone)
          : null;

      // If it's the first page, show loading state
      if (event.isFirstPage) {
        emit(const GetHomeRestaurantLoading());
      }
      // If it's not the first page and we have current data, show loading more
      else if (current != null) {
        emit(current.copyWith(isLoadingMore: true));
      }

      final dataState = await getHomeRestaurantUsecase(params: event.params);

      dataState.fold(
        (failure) {
          // If it was loading more, revert to previous state without loading
          if (!event.isFirstPage && current != null) {
            emit(current.copyWith(isLoadingMore: false));
          } else {
            emit(const GetHomeRestaurantError());
          }
        },
        (response) {
          List<HomeRestaurantEntity> newList;

          if (event.isFirstPage) {
            // First page - replace all data
            newList = response.restaurants.map((r) => r.toEntity()).toList();
          } else {
            // Subsequent pages - append to existing data
            final currentList = current?.homeRestaurants ?? [];
            final newItems = response.restaurants
                .map((e) => e.toEntity())
                .toList();

            // Avoid duplicates by checking IDs (assuming entities have an id field)
            newList = [...currentList];
            for (final newItem in newItems) {
              if (!currentList.any((existing) => existing.id == newItem.id)) {
                newList.add(newItem);
              }
            }
          }

          // Check if we've reached the maximum
          // If the response has fewer items than requested, we've reached the end
          final hasReachedMax =
              response.restaurants.length < event.params.limit ||
              newList.length >= response.totalSize;

          emit(
            GetHomeRestaurantDone(
              homeRestaurants: newList,
              isLoadingMore: false,
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      );
    } on DioException catch (e) {
      final current = state is GetHomeRestaurantDone
          ? (state as GetHomeRestaurantDone)
          : null;

      // If it was loading more, revert to previous state
      if (!event.isFirstPage && current != null) {
        emit(current.copyWith(isLoadingMore: false));
      } else {
        emit(GetHomeRestaurantError(error: e));
      }
    } catch (e) {
      final current = state is GetHomeRestaurantDone
          ? (state as GetHomeRestaurantDone)
          : null;

      // If it was loading more, revert to previous state
      if (!event.isFirstPage && current != null) {
        emit(current.copyWith(isLoadingMore: false));
      } else {
        emit(const GetHomeRestaurantError());
      }
    }
  }
}
