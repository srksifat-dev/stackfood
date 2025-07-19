import 'package:flutter/material.dart';
import 'package:stackfood/src/core/constants/app_size.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/text_styles.dart';
import 'package:stackfood/src/core/ui/widgets/custom_image_widget.dart';
import 'package:stackfood/src/features/home/domain/entities/home_popular_food_entity.dart';

class PopularFoodItemCard extends StatelessWidget {
  final HomePopularFoodEntity popularFood;

  const PopularFoodItemCard({super.key, required this.popularFood});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = constraints.maxHeight;
        double itemWidth = itemHeight * 1.2;

        return Center(
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Expanded(
                  child: ImageContainer(
                    itemHeight: itemHeight * 0.5,
                    itemWidth: itemWidth,
                    popularFood: popularFood,
                  ),
                ),
                Expanded(
                  child: InfoContainer(
                    itemHeight: itemHeight * 0.5,
                    itemWidth: itemWidth,
                    popularFood: popularFood,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.popularFood,
  });

  final double itemHeight;
  final double itemWidth;
  final HomePopularFoodEntity popularFood;

  @override
  Widget build(BuildContext context) {
    return CustomImageWidget(
      imageUrl: popularFood.imageFullUrl,
      fit: BoxFit.cover,
      height: itemHeight,
      width: itemWidth,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSpacing.lg),
        topRight: Radius.circular(AppSpacing.lg),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.popularFood,
  });

  final double itemHeight;
  final double itemWidth;
  final HomePopularFoodEntity popularFood;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      width: itemWidth,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.xs),
          bottomRight: Radius.circular(AppSize.xs),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            popularFood.name,
            style: AppTextStyles.button,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            popularFood.restaurantName,
            style: AppTextStyles.button.copyWith(color: AppColors.grey),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${popularFood.price}", style: AppTextStyles.bodyText2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: AppColors.green, size: AppSize.xs),
                  Text(
                    popularFood.avgRating.toStringAsFixed(2),
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
