import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/base/model/pagination_query_model.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/widgets/error_state_handler.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_popular_food_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_popular_food_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/popular_food_item_card.dart';
import 'package:stackfood/src/features/home/presentation/widget/popular_food_shimmer.dart';

class HomePopularFood extends StatelessWidget {
  const HomePopularFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomePopularFoodBloc, HomePopularFoodState>(
        builder: (context, state) {
          return switch (state) {
            GetHomePopularFoodLoading() => const PopularFoodShimmer(),
            GetHomePopularFoodDone(
              homePopularFoods: final foods,
              isLoadingMore: final loadingMore,
              hasReachedMax: final reachedMax,
            ) =>
              BlocListener<GlobalRefreshCubit, bool>(
                listener: (context, state) {
                  if (!state) {
                    context.read<HomePopularFoodBloc>().add(
                      GetHomePopularFoodEvent(
                        params: PaginationQuery(offset: 1, limit: 10),
                      ),
                    );
                  }
                },
                child: BlocListener<GlobalRefreshCubit, bool>(
                  listener: (_, shouldRefresh) {
                    if (shouldRefresh) {
                      context.read<HomePopularFoodBloc>().add(
                        GetHomePopularFoodEvent(
                          params: PaginationQuery(offset: 1, limit: 10),
                          isFirstPage: true,
                        ),
                      );
                    }
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: Responsive.isDesktop(context) ? 250 : 220,
                    ),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0 &&
                            !loadingMore &&
                            !reachedMax) {
                          final bloc = context.read<HomePopularFoodBloc>();
                          final nextPage = (foods.length / 10).ceil() + 1;

                          bloc.add(
                            GetHomePopularFoodEvent(
                              isFirstPage: false,
                              params: PaginationQuery(
                                offset: nextPage,
                                limit: 10,
                              ),
                            ),
                          );
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount:
                            foods!.length + (loadingMore || reachedMax ? 1 : 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == foods.length) {
                            if (loadingMore) {
                              return const Padding(
                                padding: EdgeInsets.only(left: AppSpacing.sm),
                                child: Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              );
                            } else if (reachedMax) {
                              return const SizedBox.shrink();
                            } else {
                              return const SizedBox.shrink();
                            }
                          }
                          return Padding(
                            padding: const EdgeInsets.only(left: AppSpacing.sm),
                            child: PopularFoodItemCard(
                              popularFood: foods[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            GetHomePopularFoodError error => ErrorStateHandler(
              errorMessage: error.error?.message ?? "Something went wrong",
              child: const PopularFoodShimmer(isAnimated: false),
              onRetry: () => context.read<HomePopularFoodBloc>().add(
                GetHomePopularFoodEvent(
                  params: PaginationQuery(offset: 1, limit: 10),
                  isFirstPage: true,
                ),
              ),
            ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
