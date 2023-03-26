// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:idnyt_revamped/modules/home/views/home_page.dart' as _i2;
import 'package:idnyt_revamped/modules/login/views/error_page.dart' as _i3;
import 'package:idnyt_revamped/modules/login/views/login_page.dart' as _i4;
import 'package:idnyt_revamped/shared/views/splash_screen.dart' as _i1;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreenPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ErrorPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ErrorPage(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenPage extends _i5.PageRouteInfo<void> {
  const SplashScreenPage({List<_i5.PageRouteInfo>? children})
      : super(
          SplashScreenPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i5.PageRouteInfo<void> {
  const HomePage({List<_i5.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ErrorPage]
class ErrorPage extends _i5.PageRouteInfo<void> {
  const ErrorPage({List<_i5.PageRouteInfo>? children})
      : super(
          ErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ErrorPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginPage extends _i5.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i5.PageInfo<LoginPageArgs> page =
      _i5.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}
