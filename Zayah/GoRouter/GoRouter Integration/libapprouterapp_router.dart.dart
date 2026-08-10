import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../router/app_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,

  initialLocation: AppRoutes.signIn,

  routes: [

    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) =>
          const SignInPage(),
    ),

    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) =>
          const HomePage(),
    ),

  ],

  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(
          state.error.toString(),
        ),
      ),
    );
  },
);