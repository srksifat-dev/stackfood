part of "injection_container.dart";

Future<void> _initUsecase() async {
  sl.registerSingleton<GetHomeBannerUsecase>(
    GetHomeBannerUsecase(homeRepository: sl<HomeRepository>()),
  );
  sl.registerSingleton<GetHomeCategoryUsecase>(
    GetHomeCategoryUsecase(homeRepository: sl<HomeRepository>()),
  );
  sl.registerSingleton<GetHomePopularFoodUsecase>(
    GetHomePopularFoodUsecase(homeRepository: sl<HomeRepository>()),
  );
  sl.registerSingleton<GetHomeFoodCampaignUsecase>(
    GetHomeFoodCampaignUsecase(homeRepository: sl<HomeRepository>()),
  );
  sl.registerSingleton<GetHomeRestaurantUsecase>(
    GetHomeRestaurantUsecase(homeRepository: sl<HomeRepository>()),
  );
}
