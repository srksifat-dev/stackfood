import 'package:flutter/material.dart';
import 'package:stackfood/src/core/constants/app_size.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/text_styles.dart';
import 'package:stackfood/src/core/ui/widgets/custom_image_widget.dart';
import 'package:stackfood/src/core/ui/widgets/custom_rating_widget.dart';
import 'package:stackfood/src/features/home/domain/entities/home_restaurant_entity.dart';

class RestaurantItemCard extends StatelessWidget {
  final HomeRestaurantEntity restaurant;

  const RestaurantItemCard({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      elevation: 0,
      color: Colors.white,
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: CustomImageWidget(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  imageUrl: restaurant.logoFullUrl,
                  height: 125,
                  width: 120,
                  scale: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.xxs,
              children: [
                Text(
                  restaurant.name,
                  style: AppTextStyles.button,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  restaurant.address,
                  style: AppTextStyles.button.copyWith(color: AppColors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                FittedBox(child: RatingStars(rating: restaurant.avgRating)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${restaurant.id}',
                        style: AppTextStyles.button,
                      ),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.add, size: AppSize.xlg),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
