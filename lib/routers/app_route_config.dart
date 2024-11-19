import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/screens/page/order_screens/order_detail_screen.dart';

import '../main.dart';
import '../model/order_model.dart';
import '../model/product_model.dart';
import '../screens/page/cart_screens/cart_screens.dart';
import '../screens/page/check_out_screens/check_out_screens.dart';
import '../screens/page/details_product_screens/details_product_screens.dart';
import '../screens/page/main_screens/main_screens.dart';
import 'app_route_constants.dart';

class AppRouter {
  // Static biến giữ instance của GoRouter
  static GoRouter? _router;

  // Hàm để trả về router đã khởi tạo, nếu chưa thì khởi tạo
  static GoRouter returnRouter() {
    // Nếu router chưa được khởi tạo, thì khởi tạo mới
    _router ??= GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: RouteConstants.mainRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MainApp());
          },
        ),
        GoRoute(
          path: RouteConstants.detailsProductRoute,
          pageBuilder: (context, state) {
            final productModel = state.extra as ProductModel;
            return MaterialPage(
              child: ProductDetailsScreen(productModel: productModel),
            );
          },
        ),
        GoRoute(
          name: RouteConstants.signUpRoute,
          path: '/signup',
          pageBuilder: (context, state) {
            return MaterialPage(child: Container(color: Colors.green));
          },
        ),
        GoRoute(
          name: RouteConstants.loginRoute,
          path: '/login',
          pageBuilder: (context, state) {
            return MaterialPage(child: Container(color: Colors.red));
          },
        ),
        GoRoute(
          name: RouteConstants.homeRouteName,
          path: '/home',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MainScreens());
          },
        ),
        GoRoute(
          name: RouteConstants.cartRoute,
          path: '/cart',
          pageBuilder: (context, state) {
            return const MaterialPage(child: CartScreens());
          },
        ),

        GoRoute(
          name: RouteConstants.checkOut,
          path: '/check-out',
          pageBuilder: (context, state) {
            return const MaterialPage(child: CheckoutPage());
          },
        ),
        GoRoute(
          path: RouteConstants.detailOrderRoute,
          pageBuilder: (context, state) {
            final orderModel = state.extra as OrderModel;
            return MaterialPage(
              child: OrderDetailScreen(orderModel: orderModel),
            );
          },
        ),

      ],
      errorPageBuilder: (context, state) {
        // Trang lỗi
        return MaterialPage(child: Container(color: Colors.blueGrey));
      },
    );

    return _router!;
  }
}
