import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/modules/home/views/home_page.dart';
import 'package:idnyt/modules/login/views/login_page.dart';
import 'package:idnyt/modules/shared/views/splash_screen.dart';
import 'package:idnyt/modules/signinup/views/signinup_page.dart';

part 'router.gr.dart';

// RUN AUTO ROUTER COMMAND
// flutter packages pub run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreenPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: SignInUpPage)
  ],
)
class AppRouter extends _$AppRouter {
  // ignore: unused_field
  AppRouter() : super();
}

final appRouterProvider = Provider((ref) => AppRouter());
