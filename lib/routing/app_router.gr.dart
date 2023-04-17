// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:idnyt_revamped/modules/home/views/admin_home_page.dart' as _i5;
import 'package:idnyt_revamped/modules/home/views/create_course_page.dart'
    as _i7;
import 'package:idnyt_revamped/modules/home/views/id_card_page.dart' as _i8;
import 'package:idnyt_revamped/modules/home/views/professor_home_page.dart'
    as _i9;
import 'package:idnyt_revamped/modules/home/views/professor_view_course_page.dart'
    as _i6;
import 'package:idnyt_revamped/modules/home/views/profile_page.dart' as _i10;
import 'package:idnyt_revamped/modules/home/views/student_home_page.dart'
    as _i4;
import 'package:idnyt_revamped/modules/login/views/error_page.dart' as _i11;
import 'package:idnyt_revamped/modules/login/views/login_page.dart' as _i12;
import 'package:idnyt_revamped/shared/models/course.model.dart' as _i16;
import 'package:idnyt_revamped/shared/models/user.model.dart' as _i15;
import 'package:idnyt_revamped/shared/views/splash_screen.dart' as _i3;
import 'package:idnyt_revamped/shared/views/tab_controller_page.dart' as _i2;
import 'package:idnyt_revamped/tests/extra_page.dart' as _i1;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    ExtraPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExtraPage(),
      );
    },
    TabControllerPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TabControllerPage(),
      );
    },
    SplashScreenPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreenPage(),
      );
    },
    StudentHomePage.name: (routeData) {
      final args = routeData.argsAs<StudentHomePageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.StudentHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    AdminHomePage.name: (routeData) {
      final args = routeData.argsAs<AdminHomePageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AdminHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ProfessorViewCoursePage.name: (routeData) {
      final args = routeData.argsAs<ProfessorViewCoursePageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProfessorViewCoursePage(
          key: args.key,
          course: args.course,
        ),
      );
    },
    CreateCoursePage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateCoursePage(),
      );
    },
    IDCardPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.IDCardPage(),
      );
    },
    ProfessorHomePage.name: (routeData) {
      final args = routeData.argsAs<ProfessorHomePageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfessorHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ProfilePage.name: (routeData) {
      final args = routeData.argsAs<ProfilePageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ProfilePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ErrorPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ErrorPage(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.ExtraPage]
class ExtraPage extends _i13.PageRouteInfo<void> {
  const ExtraPage({List<_i13.PageRouteInfo>? children})
      : super(
          ExtraPage.name,
          initialChildren: children,
        );

  static const String name = 'ExtraPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TabControllerPage]
class TabControllerPage extends _i13.PageRouteInfo<void> {
  const TabControllerPage({List<_i13.PageRouteInfo>? children})
      : super(
          TabControllerPage.name,
          initialChildren: children,
        );

  static const String name = 'TabControllerPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreenPage]
class SplashScreenPage extends _i13.PageRouteInfo<void> {
  const SplashScreenPage({List<_i13.PageRouteInfo>? children})
      : super(
          SplashScreenPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StudentHomePage]
class StudentHomePage extends _i13.PageRouteInfo<StudentHomePageArgs> {
  StudentHomePage({
    _i14.Key? key,
    required _i15.UserModel userData,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          StudentHomePage.name,
          args: StudentHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentHomePage';

  static const _i13.PageInfo<StudentHomePageArgs> page =
      _i13.PageInfo<StudentHomePageArgs>(name);
}

class StudentHomePageArgs {
  const StudentHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i14.Key? key;

  final _i15.UserModel userData;

  @override
  String toString() {
    return 'StudentHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i5.AdminHomePage]
class AdminHomePage extends _i13.PageRouteInfo<AdminHomePageArgs> {
  AdminHomePage({
    _i14.Key? key,
    required _i15.UserModel userData,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AdminHomePage.name,
          args: AdminHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminHomePage';

  static const _i13.PageInfo<AdminHomePageArgs> page =
      _i13.PageInfo<AdminHomePageArgs>(name);
}

class AdminHomePageArgs {
  const AdminHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i14.Key? key;

  final _i15.UserModel userData;

  @override
  String toString() {
    return 'AdminHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i6.ProfessorViewCoursePage]
class ProfessorViewCoursePage
    extends _i13.PageRouteInfo<ProfessorViewCoursePageArgs> {
  ProfessorViewCoursePage({
    _i14.Key? key,
    required _i16.CourseModel course,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProfessorViewCoursePage.name,
          args: ProfessorViewCoursePageArgs(
            key: key,
            course: course,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfessorViewCoursePage';

  static const _i13.PageInfo<ProfessorViewCoursePageArgs> page =
      _i13.PageInfo<ProfessorViewCoursePageArgs>(name);
}

class ProfessorViewCoursePageArgs {
  const ProfessorViewCoursePageArgs({
    this.key,
    required this.course,
  });

  final _i14.Key? key;

  final _i16.CourseModel course;

  @override
  String toString() {
    return 'ProfessorViewCoursePageArgs{key: $key, course: $course}';
  }
}

/// generated route for
/// [_i7.CreateCoursePage]
class CreateCoursePage extends _i13.PageRouteInfo<void> {
  const CreateCoursePage({List<_i13.PageRouteInfo>? children})
      : super(
          CreateCoursePage.name,
          initialChildren: children,
        );

  static const String name = 'CreateCoursePage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IDCardPage]
class IDCardPage extends _i13.PageRouteInfo<void> {
  const IDCardPage({List<_i13.PageRouteInfo>? children})
      : super(
          IDCardPage.name,
          initialChildren: children,
        );

  static const String name = 'IDCardPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfessorHomePage]
class ProfessorHomePage extends _i13.PageRouteInfo<ProfessorHomePageArgs> {
  ProfessorHomePage({
    _i14.Key? key,
    required _i15.UserModel userData,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProfessorHomePage.name,
          args: ProfessorHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfessorHomePage';

  static const _i13.PageInfo<ProfessorHomePageArgs> page =
      _i13.PageInfo<ProfessorHomePageArgs>(name);
}

class ProfessorHomePageArgs {
  const ProfessorHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i14.Key? key;

  final _i15.UserModel userData;

  @override
  String toString() {
    return 'ProfessorHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i10.ProfilePage]
class ProfilePage extends _i13.PageRouteInfo<ProfilePageArgs> {
  ProfilePage({
    _i14.Key? key,
    required _i15.UserModel userData,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProfilePage.name,
          args: ProfilePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i13.PageInfo<ProfilePageArgs> page =
      _i13.PageInfo<ProfilePageArgs>(name);
}

class ProfilePageArgs {
  const ProfilePageArgs({
    this.key,
    required this.userData,
  });

  final _i14.Key? key;

  final _i15.UserModel userData;

  @override
  String toString() {
    return 'ProfilePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i11.ErrorPage]
class ErrorPage extends _i13.PageRouteInfo<void> {
  const ErrorPage({List<_i13.PageRouteInfo>? children})
      : super(
          ErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ErrorPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginPage]
class LoginPage extends _i13.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i13.PageInfo<LoginPageArgs> page =
      _i13.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}
