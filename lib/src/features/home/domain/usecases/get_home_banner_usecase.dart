import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/usecase/usecase.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/domain/entities/home_banner_entity.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

/// Use case for retrieving home banner data.
class GetHomeBannerUsecase
    implements UseCase<Either<Failure, List<HomeBannerEntity>>, void> {
  final HomeRepository _homeRepository;

  GetHomeBannerUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<HomeBannerEntity>>> call({void params}) {
    return _homeRepository.getHomeBanners();
  }
}
