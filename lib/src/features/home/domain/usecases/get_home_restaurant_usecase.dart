import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/base/usecase/usecase.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/data/models/response/get_home_restaurant_response_model.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

class GetHomeRestaurantUsecase
    implements
        UseCase<
          Either<Failure, GetHomeRestaurantsResponseModel>,
          PaginationQuery
        > {
  final HomeRepository _homeRepository;

  GetHomeRestaurantUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, GetHomeRestaurantsResponseModel>> call({
    PaginationQuery? params,
  }) {
    return _homeRepository.getRestaurants(params: params ?? PaginationQuery());
  }
}
