import 'package:auto_route/auto_route.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';

// RUN AUTO ROUTER COMMAND
// flutter packages pub run build_runner build

// part 'app_router.gr.dart'; * not working for now *

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashScreenPage.page),
    AutoRoute(path: '/login', page: LoginPage.page),
    AutoRoute(path: '/error', page: ErrorPage.page),
    AutoRoute(path: '/home', page: HomePage.page),
  ];
}
