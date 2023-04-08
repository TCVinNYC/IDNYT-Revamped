// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:idnyt_revamped/modules/home/views/admin_home_page.dart' as _i4;
import 'package:idnyt_revamped/modules/home/views/blue_page.dart' as _i6;
import 'package:idnyt_revamped/modules/home/views/green_page.dart' as _i7;
import 'package:idnyt_revamped/modules/home/views/professor_home_page.dart'
    as _i8;
import 'package:idnyt_revamped/modules/home/views/red_page.dart' as _i5;
import 'package:idnyt_revamped/modules/home/views/student_home_page.dart'
    as _i3;
import 'package:idnyt_revamped/modules/login/views/error_page.dart' as _i9;
import 'package:idnyt_revamped/modules/login/views/login_page.dart' as _i10;
import 'package:idnyt_revamped/shared/models/user.dart' as _i13;
import 'package:idnyt_revamped/shared/views/splash_screen.dart' as _i2;
import 'package:idnyt_revamped/shared/views/tab_controller_page.dart' as _i1;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    TabControllerPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabControllerPage(),
      );
    },
    SplashScreenPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreenPage(),
      );
    },
    StudentHomePage.name: (routeData) {
      final args = routeData.argsAs<StudentHomePageArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.StudentHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    AdminHomePage.name: (routeData) {
      final args = routeData.argsAs<AdminHomePageArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AdminHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    RedPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RedPage(),
      );
    },
    BluePage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.BluePage(),
      );
    },
    GreenPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.GreenPage(),
      );
    },
    ProfessorHomePage.name: (routeData) {
      final args = routeData.argsAs<ProfessorHomePageArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProfessorHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ErrorPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ErrorPage(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.LoginPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.TabControllerPage]
class TabControllerPage extends _i11.PageRouteInfo<void> {
  const TabControllerPage({List<_i11.PageRouteInfo>? children})
      : super(
          TabControllerPage.name,
          initialChildren: children,
        );

  static const String name = 'TabControllerPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreenPage]
class SplashScreenPage extends _i11.PageRouteInfo<void> {
  const SplashScreenPage({List<_i11.PageRouteInfo>? children})
      : super(
          SplashScreenPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StudentHomePage]
class StudentHomePage extends _i11.PageRouteInfo<StudentHomePageArgs> {
  StudentHomePage({
    _i12.Key? key,
    required _i13.UserModel userData,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          StudentHomePage.name,
          args: StudentHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentHomePage';

  static const _i11.PageInfo<StudentHomePageArgs> page =
      _i11.PageInfo<StudentHomePageArgs>(name);
}

class StudentHomePageArgs {
  const StudentHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i12.Key? key;

  final _i13.UserModel userData;

  @override
  String toString() {
    return 'StudentHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i4.AdminHomePage]
class AdminHomePage extends _i11.PageRouteInfo<AdminHomePageArgs> {
  AdminHomePage({
    _i12.Key? key,
    required _i13.UserModel userData,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AdminHomePage.name,
          args: AdminHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminHomePage';

  static const _i11.PageInfo<AdminHomePageArgs> page =
      _i11.PageInfo<AdminHomePageArgs>(name);
}

class AdminHomePageArgs {
  const AdminHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i12.Key? key;

  final _i13.UserModel userData;

  @override
  String toString() {
    return 'AdminHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i5.RedPage]
class RedPage extends _i11.PageRouteInfo<void> {
  const RedPage({List<_i11.PageRouteInfo>? children})
      : super(
          RedPage.name,
          initialChildren: children,
        );

  static const String name = 'RedPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.BluePage]
class BluePage extends _i11.PageRouteInfo<void> {
  const BluePage({List<_i11.PageRouteInfo>? children})
      : super(
          BluePage.name,
          initialChildren: children,
        );

  static const String name = 'BluePage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.GreenPage]
class GreenPage extends _i11.PageRouteInfo<void> {
  const GreenPage({List<_i11.PageRouteInfo>? children})
      : super(
          GreenPage.name,
          initialChildren: children,
        );

  static const String name = 'GreenPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfessorHomePage]
class ProfessorHomePage extends _i11.PageRouteInfo<ProfessorHomePageArgs> {
  ProfessorHomePage({
    _i12.Key? key,
    required _i13.UserModel userData,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ProfessorHomePage.name,
          args: ProfessorHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfessorHomePage';

  static const _i11.PageInfo<ProfessorHomePageArgs> page =
      _i11.PageInfo<ProfessorHomePageArgs>(name);
}

class ProfessorHomePageArgs {
  const ProfessorHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i12.Key? key;

  final _i13.UserModel userData;

  @override
  String toString() {
    return 'ProfessorHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i9.ErrorPage]
class ErrorPage extends _i11.PageRouteInfo<void> {
  const ErrorPage({List<_i11.PageRouteInfo>? children})
      : super(
          ErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ErrorPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginPage]
class LoginPage extends _i11.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i11.PageInfo<LoginPageArgs> page =
      _i11.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}
