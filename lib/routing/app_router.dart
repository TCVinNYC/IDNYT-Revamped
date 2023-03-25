import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:idnyt/routing/app_router.gr.dart';
import 'package:idnyt/routing/auth_guard.dart';

// RUN AUTO ROUTER COMMAND
// flutter packages pub run build_runner build

// part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashScreenPage.page),
    AutoRoute(path: '/login', page: LoginPage.page),
    AutoRoute(path: '/home', page: HomePage.page),
  ];
}

// final appRouterProvider = Provider((ref) => AppRouter(ref.watch(
//     isAuthenticatedProvider as AlwaysAliveProviderListenable<AuthService>)));
