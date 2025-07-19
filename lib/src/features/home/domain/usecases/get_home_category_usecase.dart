import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/usecase/usecase.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

class GetHomeCategoryUsecase
    implements UseCase<Either<Failure, List<HomeCategoryEntity>>, void> {
  final HomeRepository _homeRepository;

  GetHomeCategoryUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> call({void params}) {
    return _homeRepository.getHomeCategories();
  }
}
