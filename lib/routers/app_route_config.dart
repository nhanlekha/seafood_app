import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/main.dart';

import 'app_route_constants.dart';

class AppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: RouteConstants.mainRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MainApp());
          },
        ),
        GoRoute(
          name: RouteConstants.signUpRoute,
          path: '/signup',
          pageBuilder: (context, state) {
            return MaterialPage(child: Container());
          },
        ),
        GoRoute(
          name: RouteConstants.loginRoute,
          path: '/login',
          pageBuilder: (context, state) {
            return MaterialPage(child: Container());
          },
        ),
        GoRoute(
          name: RouteConstants.homeRouteName,
          path: '/home',
          pageBuilder: (context, state) {
            return MaterialPage(child: Container());
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
        return MaterialPage(child: Container());
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
