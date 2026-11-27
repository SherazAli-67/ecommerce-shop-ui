import 'package:ecommerce_shop_ui/presentation/screens/cart_screen.dart';
import 'package:ecommerce_shop_ui/presentation/screens/favorites_screen.dart';
import 'package:ecommerce_shop_ui/presentation/screens/home_screen.dart';
import 'package:ecommerce_shop_ui/presentation/screens/main_shell_screen.dart';
import 'package:ecommerce_shop_ui/presentation/screens/product_detail_screen.dart';
import 'package:ecommerce_shop_ui/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (ctx, state, navigationShell) => MainShellScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: NamedRoutes.home.routeName, builder: (ctx, state) => const HomeScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: NamedRoutes.favorites.routeName, builder: (ctx, state) => const FavoritesScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: NamedRoutes.cart.routeName, builder: (ctx, state) => const CartScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: NamedRoutes.profile.routeName, builder: (ctx, state) => const ProfileScreen())]),
      ],
    ),
    GoRoute(
      path: NamedRoutes.productDetail.routeName,
      builder: (ctx, state) => ProductDetailScreen(productId: state.pathParameters['productId'] ?? ''),
    ),
  ],
);

enum NamedRoutes {
  home('/home'),
  favorites('/favorites'),
  cart('/cart'),
  profile('/profile'),
  productDetail('/product/:productId');

  final String routeName;
  const NamedRoutes(this.routeName);

  String productPath(String productId) => '/product/$productId';
}
