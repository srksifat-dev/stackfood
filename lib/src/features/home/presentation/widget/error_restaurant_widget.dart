import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/constants/app_strings.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_restaurant_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';

class ErrorRestaurantWidget extends StatelessWidget {
  const ErrorRestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: FilledButton.tonalIcon(
          style: ButtonStyle(visualDensity: VisualDensity.compact),
          onPressed: () =>
              context.read<HomeRestaurantBloc>().add(GetHomeBannerEvent()),
          label: Text(AppStrings.retry),
          icon: const Icon(Icons.refresh_sharp),
        ),
      ),
    );
  }
}
