import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/data/datasources/home_datasource.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_banner_response_model.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_category_response_model.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_food_campaign_response_model.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_popular_food_response_model.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_restaurant_response_model.dart';
import 'package:stackfood/src/features/home/domain/entities/home_banner_entity.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners() async {
    final response = await homeDataSource.getHomeBanners();

    if (response.isSuccess && response.data != null) {
      final parsed = GetHomeBannerResponseModel.fromJson(response.data);
      final List<HomeBannerEntity> bannerEntity = parsed.banners!
          .map((b) => b.toEntity())
          .toList();
      return Right(bannerEntity);
    } else {
      return Left(
        ServerFailure(response.error?.message ?? 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getHomeCategories() async {
    final response = await homeDataSource.getHomeCategories();

    if (response.isSuccess && response.data != null) {
      final parsed = GetHomeCategoryResponseModel.fromJson(response.data);
      final List<HomeCategoryEntity> categoryEntity = parsed.categories!
          .map((c) => c.toEntity())
          .toList();
      return Right(categoryEntity);
    } else {
      return Left(
        ServerFailure(response.error?.message ?? 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failure, GetHomePopularFoodResponseModel>> getHomePopularFoods({
    required PaginationQuery params,
  }) async {
    final response = await homeDataSource.getHomePopularFoods(params: params);

    if (response.isSuccess && response.data != null) {
      final parsed = GetHomePopularFoodResponseModel.fromJson(response.data);
      return Right(parsed);
    } else {
      return Left(
        ServerFailure(response.error?.message ?? 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failure, List<HomeFoodCampaignEntity>>>
  getFoodCampaigns() async {
    final response = await homeDataSource.getHomeFoodCampaigns();

    if (response.isSuccess && response.data != null) {
      final parsed = GetFoodCampaignResponseModel.fromJson(response.data);
      final List<HomeFoodCampaignEntity> campaignEntity = parsed.campaigns
          .map((c) => c.toEntity())
          .toList();
      return Right(campaignEntity);
    } else {
      return Left(
        ServerFailure(response.error?.message ?? 'Something went wrong'),
      );
    }
  }

  @override
  Future<Either<Failure, GetHomeRestaurantsResponseModel>> getRestaurants({
    required PaginationQuery params,
  }) async {
    final response = await homeDataSource.getHomeRestaurants(params: params);

    if (response.isSuccess && response.data != null) {
      final parsed = GetHomeRestaurantsResponseModel.fromJson(response.data);
      return Right(parsed);
    } else {
      return Left(
        ServerFailure(response.error?.message ?? 'Something went wrong'),
      );
    }
  }
}
