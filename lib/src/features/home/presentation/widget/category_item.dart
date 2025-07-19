import 'package:flutter/material.dart';
import 'package:stackfood/src/core/constants/app_size.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/text_styles.dart';
import 'package:stackfood/src/core/ui/widgets/custom_image_widget.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';

class CategoryItem extends StatelessWidget {
  final HomeCategoryEntity category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight * 0.6;
        return Padding(
          padding: const EdgeInsets.only(left: AppSpacing.md),
          child: Column(
            children: [
              Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomImageWidget(
                    borderRadius: BorderRadius.circular(AppSize.xs),
                    imageUrl: category.imageFullUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyText1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
