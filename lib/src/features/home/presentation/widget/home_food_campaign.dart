import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/ui/widgets/error_state_handler.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_food_campaign_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_food_campaign_state.dart';
import 'package:stackfood/src/features/home/presentation/state/home_popular_food_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/food_campaign_item_card.dart';
import 'package:stackfood/src/features/home/presentation/widget/food_campaign_shimmer.dart';

class HomeFoodCampaign extends StatelessWidget {
  const HomeFoodCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeFoodCampaignBloc, HomeFoodCampaignState>(
        builder: (context, state) => switch (state) {
          GetHomeFoodCampaingLoading() => FoodCampaignShimmer(),
          GetHomeFoodCampaingError error => ErrorStateHandler(
            errorMessage: error.error?.message ?? 'An error occurred',
            child: FoodCampaignShimmer(isAnimated: false),
            onRetry: () => context.read<HomeFoodCampaignBloc>().add(
              GetHomeFoodCampaignEvent(),
            ),
          ),
          GetHomeFoodCampaingDone(:final homeFoodCampaigns) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: Responsive.isDesktop(context) ? 165 : 135,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: homeFoodCampaigns!.length,
              itemBuilder: (context, index) {
                final campaign = homeFoodCampaigns[index];
                return FoodCampaignItemCard(campaign: campaign);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
          _ => SizedBox.shrink(),
        },
      ),
    );
  }
}
