import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/main.dart';
import 'package:seafood_app/model/product_model.dart';
import 'package:seafood_app/screens/page/main_screens/main_screens.dart';

import '../screens/page/details_product_screens/details_product_screens.dart';
import 'app_route_constants.dart';

class AppRouter {

  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
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
        // GoRoute(
        //   name: RouteConstants.profileRouteName,
        //   path: '/profile/:username/:userid',
        //   pageBuilder: (context, state) {
        //     return MaterialPage(
        //         child: Profile(
        //       userid: state.pathParameters['userid']!,
        //       username: state.pathParameters['username']!,
        //     ));
        //   },
        // ),
      ],
      errorPageBuilder: (context, state) {
        //page error
        return MaterialPage(child: Container(color: Colors.blueGrey));
      },
      // redirect: (context, state) {
      //   bool isAuth = true;
      //   if (!isAuth &&
      //       state.uri.toString()
      //           .startsWith('/${RouteConstants.profileRouteName}')) {
      //     return context.namedLocation(RouteConstants.contactUsRouteName);
      //   } else {
      //     return null;
      //   }
      // },
    );
    return router;
  }
}
