// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:cloud_firestore/cloud_firestore.dart' as _i18;
import 'package:flutter/material.dart' as _i17;
import 'package:idnyt_revamped/modules/home/views/admin_home_page.dart' as _i6;
import 'package:idnyt_revamped/modules/home/views/attendance_detail_page.dart'
    as _i5;
import 'package:idnyt_revamped/modules/home/views/course_messaging_page.dart'
    as _i8;
import 'package:idnyt_revamped/modules/home/views/create_course_page.dart'
    as _i9;
import 'package:idnyt_revamped/modules/home/views/id_card_page.dart' as _i10;
import 'package:idnyt_revamped/modules/home/views/professor_home_page.dart'
    as _i11;
import 'package:idnyt_revamped/modules/home/views/professor_view_course_page.dart'
    as _i7;
import 'package:idnyt_revamped/modules/home/views/student_home_page.dart'
    as _i4;
import 'package:idnyt_revamped/modules/login/views/error_page.dart' as _i13;
import 'package:idnyt_revamped/modules/login/views/login_page.dart' as _i14;
import 'package:idnyt_revamped/shared/models/user.model.dart' as _i19;
import 'package:idnyt_revamped/shared/views/enter_id_page.dart' as _i15;
import 'package:idnyt_revamped/shared/views/splash_screen.dart' as _i3;
import 'package:idnyt_revamped/shared/views/tab_controller_page.dart' as _i2;
import 'package:idnyt_revamped/tests/extra_page.dart' as _i1;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    ExtraPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExtraPage(),
      );
    },
    TabControllerPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TabControllerPage(),
      );
    },
    SplashScreenPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreenPage(),
      );
    },
    StudentHomePage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.StudentHomePage(),
      );
    },
    AttendanceDetailPage.name: (routeData) {
      final args = routeData.argsAs<AttendanceDetailPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AttendanceDetailPage(
          key: args.key,
          documentSnapshot: args.documentSnapshot,
        ),
      );
    },
    AdminHomePage.name: (routeData) {
      final args = routeData.argsAs<AdminHomePageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.AdminHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ProfessorViewCoursePage.name: (routeData) {
      final args = routeData.argsAs<ProfessorViewCoursePageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ProfessorViewCoursePage(
          key: args.key,
          documentSnapshot: args.documentSnapshot,
        ),
      );
    },
    CourseMessagingPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CourseMessagingPage(),
      );
    },
    CreateCoursePage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CreateCoursePage(),
      );
    },
    IDCardPage.name: (routeData) {
      final args = routeData.argsAs<IDCardPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.IDCardPage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ProfessorHomePage.name: (routeData) {
      final args = routeData.argsAs<ProfessorHomePageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProfessorHomePage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    ErrorPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ErrorPage(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.LoginPage(key: args.key),
      );
    },
    EnterIDPage.name: (routeData) {
      final args = routeData.argsAs<EnterIDPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.EnterIDPage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ExtraPage]
class ExtraPage extends _i16.PageRouteInfo<void> {
  const ExtraPage({List<_i16.PageRouteInfo>? children})
      : super(
          ExtraPage.name,
          initialChildren: children,
        );

  static const String name = 'ExtraPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TabControllerPage]
class TabControllerPage extends _i16.PageRouteInfo<void> {
  const TabControllerPage({List<_i16.PageRouteInfo>? children})
      : super(
          TabControllerPage.name,
          initialChildren: children,
        );

  static const String name = 'TabControllerPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreenPage]
class SplashScreenPage extends _i16.PageRouteInfo<void> {
  const SplashScreenPage({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StudentHomePage]
class StudentHomePage extends _i16.PageRouteInfo<void> {
  const StudentHomePage({List<_i16.PageRouteInfo>? children})
      : super(
          StudentHomePage.name,
          initialChildren: children,
        );

  static const String name = 'StudentHomePage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AttendanceDetailPage]
class AttendanceDetailPage
    extends _i16.PageRouteInfo<AttendanceDetailPageArgs> {
  AttendanceDetailPage({
    _i17.Key? key,
    required _i18.DocumentSnapshot<Object?> documentSnapshot,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AttendanceDetailPage.name,
          args: AttendanceDetailPageArgs(
            key: key,
            documentSnapshot: documentSnapshot,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDetailPage';

  static const _i16.PageInfo<AttendanceDetailPageArgs> page =
      _i16.PageInfo<AttendanceDetailPageArgs>(name);
}

class AttendanceDetailPageArgs {
  const AttendanceDetailPageArgs({
    this.key,
    required this.documentSnapshot,
  });

  final _i17.Key? key;

  final _i18.DocumentSnapshot<Object?> documentSnapshot;

  @override
  String toString() {
    return 'AttendanceDetailPageArgs{key: $key, documentSnapshot: $documentSnapshot}';
  }
}

/// generated route for
/// [_i6.AdminHomePage]
class AdminHomePage extends _i16.PageRouteInfo<AdminHomePageArgs> {
  AdminHomePage({
    _i17.Key? key,
    required _i19.UserModel userData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AdminHomePage.name,
          args: AdminHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminHomePage';

  static const _i16.PageInfo<AdminHomePageArgs> page =
      _i16.PageInfo<AdminHomePageArgs>(name);
}

class AdminHomePageArgs {
  const AdminHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i17.Key? key;

  final _i19.UserModel userData;

  @override
  String toString() {
    return 'AdminHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i7.ProfessorViewCoursePage]
class ProfessorViewCoursePage
    extends _i16.PageRouteInfo<ProfessorViewCoursePageArgs> {
  ProfessorViewCoursePage({
    _i17.Key? key,
    required _i18.DocumentSnapshot<Object?> documentSnapshot,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfessorViewCoursePage.name,
          args: ProfessorViewCoursePageArgs(
            key: key,
            documentSnapshot: documentSnapshot,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfessorViewCoursePage';

  static const _i16.PageInfo<ProfessorViewCoursePageArgs> page =
      _i16.PageInfo<ProfessorViewCoursePageArgs>(name);
}

class ProfessorViewCoursePageArgs {
  const ProfessorViewCoursePageArgs({
    this.key,
    required this.documentSnapshot,
  });

  final _i17.Key? key;

  final _i18.DocumentSnapshot<Object?> documentSnapshot;

  @override
  String toString() {
    return 'ProfessorViewCoursePageArgs{key: $key, documentSnapshot: $documentSnapshot}';
  }
}

/// generated route for
/// [_i8.CourseMessagingPage]
class CourseMessagingPage extends _i16.PageRouteInfo<void> {
  const CourseMessagingPage({List<_i16.PageRouteInfo>? children})
      : super(
          CourseMessagingPage.name,
          initialChildren: children,
        );

  static const String name = 'CourseMessagingPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CreateCoursePage]
class CreateCoursePage extends _i16.PageRouteInfo<void> {
  const CreateCoursePage({List<_i16.PageRouteInfo>? children})
      : super(
          CreateCoursePage.name,
          initialChildren: children,
        );

  static const String name = 'CreateCoursePage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IDCardPage]
class IDCardPage extends _i16.PageRouteInfo<IDCardPageArgs> {
  IDCardPage({
    _i17.Key? key,
    required _i19.UserModel userData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          IDCardPage.name,
          args: IDCardPageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'IDCardPage';

  static const _i16.PageInfo<IDCardPageArgs> page =
      _i16.PageInfo<IDCardPageArgs>(name);
}

class IDCardPageArgs {
  const IDCardPageArgs({
    this.key,
    required this.userData,
  });

  final _i17.Key? key;

  final _i19.UserModel userData;

  @override
  String toString() {
    return 'IDCardPageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i11.ProfessorHomePage]
class ProfessorHomePage extends _i16.PageRouteInfo<ProfessorHomePageArgs> {
  ProfessorHomePage({
    _i17.Key? key,
    required _i19.UserModel userData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfessorHomePage.name,
          args: ProfessorHomePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfessorHomePage';

  static const _i16.PageInfo<ProfessorHomePageArgs> page =
      _i16.PageInfo<ProfessorHomePageArgs>(name);
}

class ProfessorHomePageArgs {
  const ProfessorHomePageArgs({
    this.key,
    required this.userData,
  });

  final _i17.Key? key;

  final _i19.UserModel userData;

  @override
  String toString() {
    return 'ProfessorHomePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i12.ProfilePage]
class ProfilePage extends _i16.PageRouteInfo<ProfilePageArgs> {
  ProfilePage({
    _i17.Key? key,
    required _i19.UserModel userData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfilePage.name,
          args: ProfilePageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i16.PageInfo<ProfilePageArgs> page =
      _i16.PageInfo<ProfilePageArgs>(name);
}

class ProfilePageArgs {
  const ProfilePageArgs({
    this.key,
    required this.userData,
  });

  final _i17.Key? key;

  final _i19.UserModel userData;

  @override
  String toString() {
    return 'ProfilePageArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i13.ErrorPage]
class ErrorPage extends _i16.PageRouteInfo<void> {
  const ErrorPage({List<_i16.PageRouteInfo>? children})
      : super(
          ErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ErrorPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LoginPage]
class LoginPage extends _i16.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i16.PageInfo<LoginPageArgs> page =
      _i16.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.EnterIDPage]
class EnterIDPage extends _i16.PageRouteInfo<EnterIDPageArgs> {
  EnterIDPage({
    _i17.Key? key,
    required _i19.UserModel userData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EnterIDPage.name,
          args: EnterIDPageArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterIDPage';

  static const _i16.PageInfo<EnterIDPageArgs> page =
      _i16.PageInfo<EnterIDPageArgs>(name);
}

class EnterIDPageArgs {
  const EnterIDPageArgs({
    this.key,
    required this.userData,
  });

  final _i17.Key? key;

  final _i19.UserModel userData;

  @override
  String toString() {
    return 'EnterIDPageArgs{key: $key, userData: $userData}';
  }
}
