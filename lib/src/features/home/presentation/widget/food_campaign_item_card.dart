import 'package:flutter/material.dart';
import 'package:stackfood/src/core/constants/app_size.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/text_styles.dart';
import 'package:stackfood/src/core/ui/widgets/custom_image_widget.dart';
import 'package:stackfood/src/core/ui/widgets/custom_rating_widget.dart';
import 'package:stackfood/src/core/ui/widgets/discount_label.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';

class FoodCampaignItemCard extends StatelessWidget {
  final HomeFoodCampaignEntity campaign;

  const FoodCampaignItemCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: Responsive.isDesktop(context) ? 370 : 330,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        elevation: 0,
        color: AppColors.white,
        child: Row(
          children: [
            _ImageAndDiscountPart(campaign: campaign),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpacing.xxs,
                children: [
                  Text(
                    campaign.name,
                    style: AppTextStyles.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    campaign.restaurantName,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.grey,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  RatingStars(rating: campaign.averageRating),
                  _PriceAndAddToCartPart(campaign: campaign),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceAndAddToCartPart extends StatelessWidget {
  const _PriceAndAddToCartPart({required this.campaign});

  final HomeFoodCampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            /// We could make it double, (AS PER UI, I am keeping it as it is)
            Text(
              '\$ ${campaign.getDiscountedPrice().toStringAsFixed(0)}',
              style: AppTextStyles.button,
            ),
            const SizedBox(width: AppSpacing.md),
            Text(
              '(${campaign.price.toStringAsFixed(0)})',
              style: AppTextStyles.button.copyWith(
                color: AppColors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
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
    );
  }
}

class _ImageAndDiscountPart extends StatelessWidget {
  const _ImageAndDiscountPart({required this.campaign});

  final HomeFoodCampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: CustomImageWidget(
            borderRadius: BorderRadius.circular(AppSpacing.md),
            imageUrl: campaign.imageUrl,
            height: 125,
            width: 120,
            scale: 0.5,
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          child: DiscountLabel(discount: campaign.discount.toStringAsFixed(0)),
        ),
      ],
    );
  }
}
