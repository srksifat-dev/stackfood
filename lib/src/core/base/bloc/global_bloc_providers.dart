import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/di/injection_container.dart' as di;
import 'package:stackfood/src/features/home/presentation/bloc/home_banner_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_category_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_food_campaign_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_popular_food_bloc.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_restaurant_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';

class GlobalBlocProviders {
  static dynamic providers = [
    BlocProvider(create: (_) => di.sl<GlobalRefreshCubit>()),
    BlocProvider(
      create: (_) => di.sl<HomeBannerBloc>()..add(GetHomeBannerEvent()),
    ),
    BlocProvider(
      create: (_) => di.sl<HomeCategoryBloc>()..add(GetHomeCategoryEvent()),
    ),
    BlocProvider(
      create: (_) => di.sl<HomePopularFoodBloc>()
        ..add(
          GetHomePopularFoodEvent(
            params: PaginationQuery(offset: 1, limit: 10),
            isFirstPage: true,
          ),
        ),
    ),
    BlocProvider(
      create: (_) =>
          di.sl<HomeFoodCampaignBloc>()..add(GetHomeFoodCampaignEvent()),
    ),
    BlocProvider(
      create: (_) => di.sl<HomeRestaurantBloc>()
        ..add(
          GetHomeRestaurantEvent(
            params: PaginationQuery(offset: 1, limit: 10),
            isFirstPage: true,
          ),
        ),
    ),
  ];
}
