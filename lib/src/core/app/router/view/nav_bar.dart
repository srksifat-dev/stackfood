import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stackfood/src/core/extensions/extensions.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/utils/responsive.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Responsive.isMobile(context)
          ? navigationShell
          : Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(color: AppColors.brightGrey),
                  height: double.infinity,
                  width: Responsive.isTablet(context) ? 80 : 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.ph,
                      _NavRailItem(
                        onTap: () => _goBranch(0),
                        label: Responsive.isTablet(context) ? "" : "Home",
                        icon: Icons.home,
                        isSelected: navigationShell.currentIndex == 0,
                      ),
                      16.ph,
                      _NavRailItem(
                        onTap: () => _goBranch(1),
                        label: Responsive.isTablet(context) ? "" : "Wishlist",
                        icon: Icons.favorite_border,
                        isSelected: navigationShell.currentIndex == 1,
                      ),
                      16.ph,
                      _NavRailItem(
                        onTap: () => _goBranch(3),
                        label: Responsive.isTablet(context) ? "" : "Order",
                        icon: Icons.receipt_long,
                        isSelected: navigationShell.currentIndex == 3,
                      ),
                      16.ph,
                      _NavRailItem(
                        onTap: () => _goBranch(4),
                        label: Responsive.isTablet(context) ? "" : 'More',
                        icon: Icons.menu,
                        isSelected: navigationShell.currentIndex == 4,
                      ),
                    ],
                  ),
                ),
                Expanded(child: navigationShell),
              ],
            ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomAppBar(
              height: 56,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BuildNavItem(
                    onTap: () => _goBranch(0),
                    label: "Home",
                    icon: Icons.home,
                    isSelected: navigationShell.currentIndex == 0,
                  ),
                  _BuildNavItem(
                    onTap: () => _goBranch(1),
                    label: "Wishlist",
                    icon: Icons.favorite_border,
                    isSelected: navigationShell.currentIndex == 1,
                  ),
                  const SizedBox(width: 100),
                  _BuildNavItem(
                    onTap: () => _goBranch(3),
                    label: "Order",
                    icon: Icons.receipt_long,
                    isSelected: navigationShell.currentIndex == 3,
                  ),
                  _BuildNavItem(
                    onTap: () => _goBranch(4),
                    label: 'More',
                    icon: Icons.menu,
                    isSelected: navigationShell.currentIndex == 4,
                  ),
                ],
              ),
            )
          : null,
      floatingActionButton: Responsive.isMobile(context)
          ? SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: AppColors.green,
                elevation: 0,
                onPressed: () {
                  _goBranch(2);
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Custom Bottom Nav Bar Item

class _BuildNavItem extends StatelessWidget {
  const _BuildNavItem({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: IconButton(
        onPressed: onTap,
        style: ButtonStyle(visualDensity: VisualDensity.compact),
        icon: Icon(icon, color: isSelected ? AppColors.green : AppColors.grey),
      ),
    );
  }
}

// Custom Navigation Rail Item
class _NavRailItem extends StatelessWidget {
  const _NavRailItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return label != ""
        ? TextButton.icon(
            onPressed: onTap,
            label: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.green : AppColors.grey,
                fontSize: isSelected ? 20 : 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            style: ButtonStyle(visualDensity: VisualDensity.compact),

            icon: Icon(
              icon,
              color: isSelected ? AppColors.green : AppColors.grey,
              size: isSelected ? 32 : 24,
            ),
          )
        : IconButton(
            onPressed: onTap,
            style: ButtonStyle(visualDensity: VisualDensity.compact),

            icon: Icon(
              icon,
              color: isSelected ? AppColors.green : AppColors.grey,
              size: isSelected ? 32 : 24,
            ),
          );
  }
}
