import 'package:stackfood/src/core/base/model/pagination_query_model.dart';

abstract class HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

class GetHomeCategoryEvent extends HomeEvent {}

class GetHomePopularFoodEvent extends HomeEvent {
  final PaginationQuery params;
  final bool isFirstPage;
  GetHomePopularFoodEvent({required this.params, this.isFirstPage = true});
}

class GetHomeFoodCampaignEvent extends HomeEvent {}

class GetHomeRestaurantEvent extends HomeEvent {
  final PaginationQuery params;
  final bool isFirstPage;
  GetHomeRestaurantEvent({required this.params, this.isFirstPage = true});
}
