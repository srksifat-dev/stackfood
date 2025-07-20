import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/features/home/domain/usecases/get_home_food_campaign_usecase.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_food_campaign_state.dart';

/// BLoC responsible for managing the state of home food campaigns.
class HomeFoodCampaignBloc extends Bloc<HomeEvent, HomeFoodCampaignState> {
  final GetHomeFoodCampaignUsecase getHomeFoodCampaignUsecase;

  /// Creates a [HomeFoodCampaignBloc] instance.
  HomeFoodCampaignBloc({required this.getHomeFoodCampaignUsecase})
    : super(GetHomeFoodCampaingLoading()) {
    on<GetHomeFoodCampaignEvent>(onGetHomeFoodCampaign);
  }

  void onGetHomeFoodCampaign(
    GetHomeFoodCampaignEvent event,
    Emitter<HomeFoodCampaignState> emit,
  ) async {
    try {
      final dataState = await getHomeFoodCampaignUsecase();

      dataState.fold(
        (failure) => emit(GetHomeFoodCampaingError()),
        (campaigns) =>
            emit(GetHomeFoodCampaingDone(homeFoodCampaigns: campaigns)),
      );
    } on DioException catch (e) {
      emit(GetHomeFoodCampaingError(error: e));
    }
  }
}
