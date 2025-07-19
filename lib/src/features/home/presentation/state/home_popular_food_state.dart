import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stackfood/src/features/home/domain/entities/home_popular_food_entity.dart';

abstract class HomePopularFoodState extends Equatable {
  const HomePopularFoodState();

  @override
  List<Object?> get props => [];
}

class GetHomePopularFoodLoading extends HomePopularFoodState {
  const GetHomePopularFoodLoading();
}

class GetHomePopularFoodDone extends HomePopularFoodState {
  final List<HomePopularFoodEntity>? homePopularFoods;
  final bool isLoadingMore;
  final bool hasReachedMax;

  const GetHomePopularFoodDone({
    required this.homePopularFoods,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });

  GetHomePopularFoodDone copyWith({
    List<HomePopularFoodEntity>? homePopularFoods,
    bool? isLoadingMore,
    bool? hasReachedMax,
  }) => GetHomePopularFoodDone(
    homePopularFoods: homePopularFoods ?? this.homePopularFoods,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  );
}

class GetHomePopularFoodError extends HomePopularFoodState {
  final DioException? error;
  const GetHomePopularFoodError({this.error});
}
