import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stackfood/src/core/ui/widgets/custom_image_widget.dart';
import 'package:stackfood/src/core/utils/responsive.dart';

class AppCarouselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final Size indicatorSize;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final double maxHeight;

  AppCarouselSlider({
    super.key,
    required this.imageUrls,
    this.indicatorSize = const Size(10, 10),
    this.autoPlay = true,
    this.enlargeCenterPage = true,
    this.maxHeight = 100,
  });

  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double carouselHeight = Responsive.isMobile(context)
            ? constraints.maxHeight * 0.3
            : constraints.maxHeight * 0.8;

        return Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: carouselHeight,
                minHeight: Responsive.isMobile(context) ? 100 : 400,
              ),
              child: AspectRatio(
                aspectRatio: Responsive.isMobile(context) ? 20 / 5 : 20 / 1,
                child: CarouselSlider.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: RepaintBoundary(
                          child: CustomImageWidget(
                            scale: 1,
                            imageUrl: imageUrls[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: carouselHeight,
                    clipBehavior: Clip.antiAlias,
                    enlargeCenterPage: enlargeCenterPage,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 500,
                    ),
                    autoPlayCurve: Curves.ease,
                    autoPlay: autoPlay,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      _currentIndexNotifier.value = index;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: _currentIndexNotifier,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(imageUrls.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: CustomPaint(
                        size: indicatorSize,
                        painter: CircleIndicatorPainter(
                          isActive: index == value,
                          context: context,
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class CircleIndicatorPainter extends CustomPainter {
  final bool isActive;
  final BuildContext context;
  final Color activeColor;
  final Color inactiveColor;

  CircleIndicatorPainter({
    required this.isActive,
    required this.context,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.orange,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = isActive ? size.width / 2 : size.width / 3;

    final Paint fillPaint = Paint()
      ..color = isActive ? activeColor : inactiveColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero), radius, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
