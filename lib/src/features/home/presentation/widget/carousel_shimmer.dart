import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/src/core/ui/widgets/app_carousel.dart';
import 'package:stackfood/src/core/ui/widgets/static_shimmer_effect.dart';

class CarouselShimmer extends StatelessWidget {
  final bool isAnimated;

  const CarouselShimmer({super.key, this.isAnimated = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        effect: isAnimated ? null : StaticShimmerEffect(),
        child: AppCarouselSlider(
          autoPlay: false,
          imageUrls: [
            'https://placehold.co/600x150',
            'https://placehold.co/600x150',
            'https://placehold.co/600x150',
            'https://placehold.co/600x150',
            'https://placehold.co/600x150',
            'https://placehold.co/600x150',
          ],
        ),
      ),
    );
  }
}
