import 'package:stackfood/src/core/api/src/api_client.dart';
import 'package:stackfood/src/core/api/src/api_endpoints.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final ApiClient _apiClient;

  HomeDataSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<ApiResponse<dynamic>> getHomeBanners() async {
    final response = await _apiClient.get(
      apiType: APIType.public,
      path: ApiEndpoints.homeBanners,
    );

    return response;
  }

  @override
  Future<ApiResponse<dynamic>> getHomeCategories() async {
    final response = await _apiClient.get(
      apiType: APIType.public,
      path: ApiEndpoints.homeCategories,
    );

    return response;
  }

  @override
  Future<ApiResponse<dynamic>> getHomePopularFoods({
    required PaginationQuery params,
  }) async {
    final response = await _apiClient.get(
      apiType: APIType.public,
      path: ApiEndpoints.homePopularProducts,
      query: {'offset': params.offset, 'limit': params.limit},
    );

    return response;
  }

  @override
  Future<ApiResponse<dynamic>> getHomeFoodCampaigns() async {
    final response = await _apiClient.get(
      apiType: APIType.public,
      path: ApiEndpoints.homeFoodCampaigns,
    );

    return response;
  }

  @override
  Future<ApiResponse<dynamic>> getHomeRestaurants({
    required PaginationQuery params,
  }) async {
    final response = await _apiClient.get(
      apiType: APIType.public,
      path: ApiEndpoints.homeRestaurants,
      query: {'offset': params.offset, 'limit': params.limit},
    );

    return response;
  }
}
