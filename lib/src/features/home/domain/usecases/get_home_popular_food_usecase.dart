import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/base/usecase/usecase.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_popular_food_response_model.dart';
import 'package:stackfood/src/features/home/domain/entities/home_popular_food_entity.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

class GetHomePopularFoodUsecase
    implements
        UseCase<
          Either<Failure, GetHomePopularFoodResponseModel>,
          PaginationQuery
        > {
  final HomeRepository _homeRepository;

  GetHomePopularFoodUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, GetHomePopularFoodResponseModel>> call({
    PaginationQuery? params,
  }) {
    return _homeRepository.getHomePopularFoods(
      params: params ?? PaginationQuery(),
    );
  }
}
