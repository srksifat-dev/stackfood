import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';

abstract class HomeFoodCampaignState extends Equatable {
  HomeFoodCampaignState();

  @override
  List<Object?> get props => [];
}

class GetHomeFoodCampaingLoading extends HomeFoodCampaignState {}

class GetHomeFoodCampaingDone extends HomeFoodCampaignState {
  final List<HomeFoodCampaignEntity>? homeFoodCampaigns;
  GetHomeFoodCampaingDone({this.homeFoodCampaigns});
}

class GetHomeFoodCampaingError extends HomeFoodCampaignState {
  final DioException? error;
  GetHomeFoodCampaingError({this.error});
}
