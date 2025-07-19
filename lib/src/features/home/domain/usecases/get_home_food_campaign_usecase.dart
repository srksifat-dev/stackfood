import 'package:dartz/dartz.dart';
import 'package:stackfood/src/core/base/usecase/usecase.dart';
import 'package:stackfood/src/core/exception/failures.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';
import 'package:stackfood/src/features/home/domain/repositories/home_repository.dart';

class GetHomeFoodCampaignUsecase
    implements UseCase<Either<Failure, List<HomeFoodCampaignEntity>>, void> {
  final HomeRepository _homeRepository;

  GetHomeFoodCampaignUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<HomeFoodCampaignEntity>>> call({void params}) {
    return _homeRepository.getFoodCampaigns();
  }
}
