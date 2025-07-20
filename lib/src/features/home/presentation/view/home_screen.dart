import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/constants/app_strings.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_restaurant_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_restaurant_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/category_items.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_app_bar.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_carousel.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_food_campaign.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_restaurant.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_title.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_popular_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  static const int _pageSize = 10;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    _currentPage = 1;
    context.read<HomeRestaurantBloc>().add(
      GetHomeRestaurantEvent(
        isFirstPage: true,
        params: PaginationQuery(offset: _currentPage, limit: _pageSize),
      ),
    );
  }

  void _scrollListener() {
    if (_isLoadingMore) return; // Prevent multiple calls

    // Check if we've scrolled to 80% of the content
    final scrollPosition = _scrollController.position;
    if (scrollPosition.pixels >= scrollPosition.maxScrollExtent * 0.8) {
      final bloc = context.read<HomeRestaurantBloc>();
      final currentState = bloc.state;

      // Debug print
      print('Scroll triggered - Current state: ${currentState.runtimeType}');

      if (currentState is GetHomeRestaurantDone) {
        print(
          'IsLoadingMore: ${currentState.isLoadingMore}, HasReachedMax: ${currentState.hasReachedMax}',
        );
        print(
          'Current restaurants count: ${currentState.homeRestaurants?.length ?? 0}',
        );
      }

      // Only load more if conditions are met
      if (currentState is GetHomeRestaurantDone &&
          !currentState.isLoadingMore &&
          !currentState.hasReachedMax) {
        _isLoadingMore = true;
        _currentPage++;

        print('Loading page: $_currentPage');

        bloc.add(
          GetHomeRestaurantEvent(
            isFirstPage: false,
            params: PaginationQuery(offset: _currentPage, limit: _pageSize),
          ),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    context.read<GlobalRefreshCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 100,
          color: Colors.white,
          elevation: 10,
          semanticsLabel: 'Refresh',
          semanticsValue: 'Refresh',
          strokeWidth: 2,
          backgroundColor: Colors.orange,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: _onRefresh,
          child: BlocListener<HomeRestaurantBloc, HomeRestaurantState>(
            listener: (context, state) {
              print('BlocListener - State changed to: ${state.runtimeType}');

              // Reset loading flag when state changes
              if (state is GetHomeRestaurantDone ||
                  state is GetHomeRestaurantError) {
                _isLoadingMore = false;

                if (state is GetHomeRestaurantDone) {
                  print(
                    'BlocListener - Restaurants count: ${state.homeRestaurants?.length ?? 0}',
                  );
                  print('BlocListener - IsLoadingMore: ${state.isLoadingMore}');
                  print('BlocListener - HasReachedMax: ${state.hasReachedMax}');
                }
              }

              // Handle errors
              if (state is GetHomeRestaurantError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message ?? 'Failed to load restaurants',
                    ),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: 'Retry',
                      onPressed: _loadInitialData,
                    ),
                  ),
                );
              }
            },
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // App bar
                const HomeAppBar(),
                const SliverGap(AppSpacing.md),

                // Carousel
                HomeCarousel(),
                const SliverGap(AppSpacing.md),

                // Categories
                HomeTitle(title: AppStrings.categories, onViewAllTap: () {}),
                HomeCategory(),
                const SliverGap(AppSpacing.md),

                // Popular Food
                HomeTitle(
                  title: AppStrings.popularFoodNearBy,
                  onViewAllTap: () {},
                ),
                HomePopularFood(),
                const SliverGap(AppSpacing.md),

                // Food Campaign
                HomeTitle(title: AppStrings.foodCampaign, onViewAllTap: () {}),
                HomeFoodCampaign(),
                const SliverGap(AppSpacing.md),

                // Restaurant
                HomeTitle(title: AppStrings.restaurants, onViewAllTap: () {}),
                HomeRestaurant(),
                const SliverGap(AppSpacing.xxxlg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
