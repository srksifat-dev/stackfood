part of 'injection_container.dart';

Future<void> _initDataSources() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<HomeDataSource>(
    HomeDataSourceImpl(
      apiClient: ApiClient.instance
        ..init(baseUrl: ApiEndpoints.baseUrl, cacheService: CacheService()),
    ),
  );
}
