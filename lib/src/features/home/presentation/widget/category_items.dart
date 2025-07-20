import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/src/core/base/bloc/global_refresh_cubit.dart';
import 'package:stackfood/src/core/ui/widgets/error_state_handler.dart';
import 'package:stackfood/src/core/utils/responsive.dart';
import 'package:stackfood/src/features/home/presentation/bloc/home_category_bloc.dart';
import 'package:stackfood/src/features/home/presentation/event/home_event.dart';
import 'package:stackfood/src/features/home/presentation/state/home_category_state.dart';
import 'package:stackfood/src/features/home/presentation/widget/category_item.dart';
import 'package:stackfood/src/features/home/presentation/widget/category_shimmer.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCategoryBloc, HomeCategoryState>(
        builder: (context, state) {
          return switch (state) {
            GetHomeCategoryLoading() => CategoryShimmerWidget(),
            GetHomeCategoryDone() => BlocListener<GlobalRefreshCubit, bool>(
              listener: (context, state) {
                if (!state) {
                  context.read<HomeCategoryBloc>().add(GetHomeCategoryEvent());
                }
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: Responsive.isDesktop(context) ? 150 : 100,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CategoryItem(category: state.homeCategories![index]),
                  itemCount: state.homeCategories!.length,
                ),
              ),
            ),
            GetHomeCategoryError error => ErrorStateHandler(
              errorMessage: error.error?.message ?? 'Something went wrong',
              child: CategoryShimmerWidget(isAnimated: false),
              onRetry: () =>
                  context.read<HomeCategoryBloc>().add(GetHomeCategoryEvent()),
            ),
            _ => SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
