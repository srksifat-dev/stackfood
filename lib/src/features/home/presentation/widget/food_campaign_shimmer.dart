import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/src/core/ui/widgets/static_shimmer_effect.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';
import 'package:stackfood/src/features/home/presentation/widget/food_campaign_item_card.dart';

class FoodCampaignShimmer extends StatelessWidget {
  final bool isAnimated;

  const FoodCampaignShimmer({this.isAnimated = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        effect: isAnimated ? null : StaticShimmerEffect(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Responsive.isDesktop(context) ? 165 : 135,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => FoodCampaignItemCard(
              campaign: HomeFoodCampaignEntity(
                id: 0,
                name: 'something',
                averageRating: 5,
                imageUrl: '',
                description: 'Description of the campaign',
                discount: 0,
                discountType: '',
                price: 0,
                restaurantName: 'Restaurant Name',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
