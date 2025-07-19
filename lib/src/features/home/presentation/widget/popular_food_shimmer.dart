import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/widgets/static_shimmer_effect.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/domain/entities/home_popular_food_entity.dart';
import 'package:stackfood/src/features/home/presentation/widget/popular_food_item_card.dart';

class PopularFoodShimmer extends StatelessWidget {
  final bool isAnimated;

  const PopularFoodShimmer({this.isAnimated = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        effect: isAnimated ? null : StaticShimmerEffect(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Responsive.isDesktop(context) ? 250 : 220,
          ),
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: AppSpacing.sm),
              child: PopularFoodItemCard(
                popularFood: HomePopularFoodEntity(
                  id: 0,
                  name: "Food Name",
                  description: "Food Description",
                  image: "image",
                  categoryId: 0,
                  price: 0,
                  restaurantId: 0,
                  avgRating: 5,
                  restaurantName: "Restaurant Name",
                  imageFullUrl: "image URL",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
