import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stackfood/src/features/home/domain/entities/home_restaurant_entity.dart';

abstract class HomeRestaurantState extends Equatable {
  const HomeRestaurantState();

  @override
  List<Object?> get props => [];
}

final class GetHomeRestaurantLoading extends HomeRestaurantState {
  const GetHomeRestaurantLoading();
}

final class GetHomeRestaurantDone extends HomeRestaurantState {
  final List<HomeRestaurantEntity>? homeRestaurants;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final int timestamp; // Add timestamp to force state updates

  const GetHomeRestaurantDone({
    required this.homeRestaurants,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  }) : timestamp = 0;

  const GetHomeRestaurantDone._({
    required this.homeRestaurants,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    required this.timestamp,
  });

  GetHomeRestaurantDone copyWith({
    List<HomeRestaurantEntity>? homeRestaurants,
    bool? isLoadingMore,
    bool? hasReachedMax,
  }) => GetHomeRestaurantDone._(
    homeRestaurants: homeRestaurants ?? this.homeRestaurants,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );

  @override
  List<Object?> get props => [
    homeRestaurants?.length,
    isLoadingMore,
    hasReachedMax,
    timestamp,
    homeRestaurants?.map((e) => e.id).toList(), // Include IDs to detect changes
  ];
}

final class GetHomeRestaurantError extends HomeRestaurantState {
  final DioException? error;
  final String? message;

  const GetHomeRestaurantError({this.error, this.message});

  @override
  List<Object?> get props => [error, message];
}
