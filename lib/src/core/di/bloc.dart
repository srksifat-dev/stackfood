part of 'injection_container.dart';

Future<void> _initBlocs() async {
  sl.registerFactory(() => GlobalRefreshCubit());
  sl.registerFactory(() => HomeBannerBloc(getHomeBannerUsecase: sl()));
  sl.registerFactory(() => HomeCategoryBloc(getHomeCategoryUsecase: sl()));
  sl.registerFactory(
    () => HomePopularFoodBloc(getHomePopularFoodUsecase: sl()),
  );
  sl.registerFactory(
    () => HomeFoodCampaignBloc(getHomeFoodCampaignUsecase: sl()),
  );
  sl.registerFactory(() => HomeRestaurantBloc(getHomeRestaurantUsecase: sl()));
}
