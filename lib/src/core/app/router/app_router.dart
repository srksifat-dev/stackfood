import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stackfood/src/core/app/router/view/nav_bar.dart';
import 'package:stackfood/src/core/extensions/path_extension.dart';
import 'package:stackfood/src/core/widgets/error_screen.dart';
import 'package:stackfood/src/features/cart/presentation/view/cart_screen.dart';
import 'package:stackfood/src/features/home/presentation/view/home_screen.dart';
import 'package:stackfood/src/features/more/presentation/view/more_screen.dart';
import 'package:stackfood/src/features/order/presentation/view/order_screen.dart';
import 'package:stackfood/src/features/wishlist/presentation/view/wishlist_screen.dart';

class Routes {
  static const errorScreen = "error";
  static const homeScreen = "/";
  static const wishlistScreen = "wishlist";
  static const cartScreen = "cart";
  static const orderScreen = "order";
  static const moreScreen = "more";
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: '_rootNavigatorKey',
);

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [_buildErrorScreenRoute(), _buildShellRoutes()],
);

StatefulShellRoute _buildShellRoutes() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(routes: [_buildHomeScreenRoute()]),
      StatefulShellBranch(routes: [_buildWishlistScreenRoute()]),
      StatefulShellBranch(routes: [_buildMyCartRoute()]),
      StatefulShellBranch(routes: [_buildMyOrderRoute()]),
      StatefulShellBranch(routes: [_buildMoreRoute()]),
    ],
  );
}

GoRoute _buildHomeScreenRoute() => GoRoute(
  name: Routes.homeScreen,
  path: Routes.homeScreen,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const HomeScreen(),
  ),
);

GoRoute _buildWishlistScreenRoute() => GoRoute(
  path: Routes.wishlistScreen.p,
  name: Routes.wishlistScreen,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const WishlistScreen(),
  ),
);

GoRoute _buildErrorScreenRoute() => GoRoute(
  parentNavigatorKey: _rootNavigatorKey,
  name: Routes.errorScreen,
  path: Routes.errorScreen.p,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const ErrorScreen(),
  ),
);

GoRoute _buildMyCartRoute() => GoRoute(
  path: Routes.cartScreen.p,
  name: Routes.cartScreen,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const CartScreen(),
  ),
);

GoRoute _buildMyOrderRoute() => GoRoute(
  path: Routes.orderScreen.p,
  name: Routes.orderScreen,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const OrderScreen(),
  ),
);

GoRoute _buildMoreRoute() => GoRoute(
  path: Routes.moreScreen.p,
  name: Routes.moreScreen,
  pageBuilder: _getDefaultPageBuilderByPlatform(
    childBuilder: (_, __) => const MoreScreen(),
  ),
);

//-------- Platform Wrapper-----------//

GoRouterPageBuilder _getDefaultPageBuilderByPlatform({
  required Widget Function(BuildContext context, GoRouterState goRouterState)
  childBuilder,
}) =>
    (context, goRouterState) =>
        _getPageByPlatform(child: childBuilder(context, goRouterState));

Page<T> _getPageByPlatform<T>({required Widget child}) {
  if (kIsWeb) {
    return MaterialPage(child: child);
  } else {
    if (Platform.isAndroid) {
      return MaterialPage(child: child);
    }
    if (Platform.isIOS) {
      return CupertinoPage(child: child);
    }
    return MaterialPage(child: child);
  }
}
