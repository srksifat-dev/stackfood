import 'package:flutter/material.dart';
import 'package:stackfood/src/core/constants/app_spacing.dart';
import 'package:stackfood/src/core/constants/app_strings.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/font_weights.dart';
import 'package:stackfood/src/core/ui/typography/text_styles.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const HomeTitle({super.key, required this.title, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _CustomSliverHeaderDelegate(
        title: title,
        onViewAllTap: onViewAllTap,
      ),
    );
  }
}

class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final VoidCallback? onViewAllTap;

  _CustomSliverHeaderDelegate({required this.title, this.onViewAllTap});

  @override
  double get minExtent => 40.0;

  @override
  double get maxExtent => 40.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
      /// Since Material Widget takes 8 gap by default, I subtracted 8 from the right side.
      padding: const EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.headline4.copyWith(
                fontWeight: AppFontWeight.extraBold,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              splashFactory: InkSplash.splashFactory,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onViewAllTap,
            child: Text(
              AppStrings.viewAll,
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.green,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.green,
                decorationThickness: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
