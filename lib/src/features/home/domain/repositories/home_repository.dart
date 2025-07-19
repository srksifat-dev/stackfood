import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_popular_food_response_model.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_restaurant_response_model.dart';
import 'package:stackfood/src/features/home/domain/entities/home_banner_entity.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';

abstract interface class HomeRepository {
  // Get home banners
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners();

  // Get home categories
  Future<Either<Failure, List<HomeCategoryEntity>>> getHomeCategories();

  // Get home popular foods
  Future<Either<Failure, GetHomePopularFoodResponseModel>> getHomePopularFoods({
    required PaginationQuery params,
  });

  // Get Food Campaigns
  Future<Either<Failure, List<HomeFoodCampaignEntity>>> getFoodCampaigns();

  /// Get Restaurants
  Future<Either<Failure, GetHomeRestaurantsResponseModel>> getRestaurants({
    required PaginationQuery params,
  });
}
