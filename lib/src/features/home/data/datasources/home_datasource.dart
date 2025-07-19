import 'package:stackfood/src/core/api/src/api_client.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';

abstract interface class HomeDataSource {
  Future<ApiResponse<dynamic>> getHomeBanners();

  Future<ApiResponse<dynamic>> getHomeCategories();

  Future<ApiResponse<dynamic>> getHomePopularFoods({
    required PaginationQuery params,
  });

  Future<ApiResponse<dynamic>> getHomeFoodCampaigns();

  Future<ApiResponse<dynamic>> getHomeRestaurants({
    required PaginationQuery params,
  });
}
