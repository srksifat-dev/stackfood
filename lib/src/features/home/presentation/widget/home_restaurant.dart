import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/constants/app_strings.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_restaurant_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_restaurant_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/error_restaurant_widget.dart';
import 'package:stackfood/src/features/home/presentation/widget/home_restaurant_shimmer.dart';
import 'package:stackfood/src/features/home/presentation/widget/restaurant_item_card.dart';

class HomeRestaurant extends StatefulWidget {
  const HomeRestaurant({super.key});

  @override
  State<HomeRestaurant> createState() => _HomeRestaurantState();
}

class _HomeRestaurantState extends State<HomeRestaurant> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRestaurantBloc, HomeRestaurantState>(
      builder: (context, state) {
        if (state is GetHomeRestaurantLoading) {
          return const RestaurantShimmer();
        }

        if (state is GetHomeRestaurantError) {
          return ErrorRestaurantWidget();
        }

        if (state is GetHomeRestaurantDone) {
          final list = state.homeRestaurants ?? [];

          return Responsive(
            mobile: _buildMobileLayout(context, state, list),
            tablet: _buildTabletLayout(context, state, list),
            desktop: _buildDesktopLayout(context, state, list),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  // Mobile layout (existing SliverList)
  Widget _buildMobileLayout(
    BuildContext context,
    GetHomeRestaurantDone state,
    List list,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == list.length) {
          if (state.isLoadingMore) {
            return const RestaurantShimmer(useSliver: false);
          } else if (state.hasReachedMax && list.isNotEmpty) {
            return _buildNoMoreDataWidget();
          }
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.custom10),
          child: RestaurantItemCard(restaurant: list[index]),
        );
      }, childCount: list.length + 1),
    );
  }

  // Tablet layout (2 columns grid)
  Widget _buildTabletLayout(
    BuildContext context,
    GetHomeRestaurantDone state,
    List list,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.custom10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.custom10,
          mainAxisSpacing: AppSpacing.custom10,
          childAspectRatio: 2, // Adjust this ratio based on your card design
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == list.length) {
              if (state.isLoadingMore) {
                return const RestaurantShimmer(useSliver: false);
              } else if (state.hasReachedMax && list.isNotEmpty) {
                return _buildGridEndWidget();
              }
              return const SizedBox.shrink();
            }

            return RestaurantItemCard(restaurant: list[index]);
          },
          childCount:
              list.length +
              (state.isLoadingMore || state.hasReachedMax ? 1 : 0),
        ),
      ),
    );
  }

  // Desktop layout (3 columns grid)
  Widget _buildDesktopLayout(
    BuildContext context,
    GetHomeRestaurantDone state,
    List list,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.custom10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: AppSpacing.custom10,
          mainAxisSpacing: AppSpacing.custom10,
          childAspectRatio: 2, // Adjust this ratio based on your card design
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == list.length) {
              if (state.isLoadingMore) {
                return const RestaurantShimmer(useSliver: false);
              } else if (state.hasReachedMax && list.isNotEmpty) {
                return _buildGridEndWidget();
              }
              return const SizedBox.shrink();
            }

            return RestaurantItemCard(restaurant: list[index]);
          },
          childCount:
              list.length +
              (state.isLoadingMore || state.hasReachedMax ? 1 : 0),
        ),
      ),
    );
  }

  // Widget for mobile no more data
  Widget _buildNoMoreDataWidget() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Center(
      child: Column(children: [Text(AppStrings.noMoreRestaurant), Gap(100)]),
    ),
  );

  // Widget for grid no more data (spans full width)
  Widget _buildGridEndWidget() => Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(AppStrings.noMoreRestaurant), Gap(20)],
      ),
    ),
  );
}
