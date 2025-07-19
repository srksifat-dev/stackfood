import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/ui/widgets/app_carousel.dart';
import 'package:stackfood/src/core/ui/widgets/error_state_handler.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_banner_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_banner_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/carousel_shimmer.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBannerBloc, HomeBannerState>(
        builder: (context, state) {
          return switch (state) {
            GetHomeBannerLoading() => CarouselShimmer(isAnimated: true),
            GetHomeBannerDone(:final homeBanners) => AppCarouselSlider(
              imageUrls: homeBanners!.map((e) => e.imageUrl).toList(),
              enlargeCenterPage: false,
            ),
            GetHomeBannerError error => ErrorStateHandler(
              errorMessage: error.error?.message ?? '',
              child: Container(),
              onRetry: () =>
                  context.read<HomeBannerBloc>().add(GetHomeBannerEvent()),
            ),
            _ => SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
