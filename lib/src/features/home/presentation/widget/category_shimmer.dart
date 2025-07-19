import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/src/core/ui/widgets/static_shimmer_effect.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';
import 'package:stackfood/src/features/home/presentation/widget/category_item.dart';

class CategoryShimmerWidget extends StatelessWidget {
  final bool isAnimated;

  const CategoryShimmerWidget({this.isAnimated = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        effect: isAnimated ? null : StaticShimmerEffect(),
        justifyMultiLineText: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Responsive.isMobile(context) ? 100 : 150,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryItem(
              category: HomeCategoryEntity(
                parentId: 0,
                childesCount: 0,
                createdAt: '',
                imageFullUrl: '',
                orderCount: '',
                priority: 0,
                productsCount: 0,
                slug: '',
                status: 0,
                updatedAt: '',
                position: 0,
                id: 0,
                name: 'something',
                image: '',
              ),
            ),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
