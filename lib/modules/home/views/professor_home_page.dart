// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_class_widget.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'ProfessorHomePage')
class ProfessorHomePage extends HookConsumerWidget {
  UserModel userData;
  ProfessorHomePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            children: professorClasses,
          ),

          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const Text('Hey Professor you signed in!'),
          //     Text(userData.email),
          //     Text(userData.fullName),
          //     Text(userData.role),
          //     // Display the list of classes on the professor's home screen.
          //     RegularButtonWidget(
          //         text: "Sign Out",
          //         onPressed: () {
          //           auth.signOut();
          //           AutoRouter.of(context).replace(LoginPage());
          //         })
          //   ],
          // ),
        ),
      ),
    );
  }
}

List<Widget> professorClasses = [
  const ProfessorClassWidget(
    className: "Mobile App Development",
    classCode: "CS321",
    semester: "Spring 2023",
    daysOfWeek: ["Monday", "Wednesday"],
    classTime: "2:00 PM - 3:15 PM",
    classLocation: "Building 1, Room 101",
    numStudents: 28,
    numNotifications: 1,
    attendanceRate: 30,
  ),
  const ProfessorClassWidget(
    className: "Database Systems",
    classCode: "CS341",
    semester: "Spring 2023",
    daysOfWeek: ["Thursday", "Saturday"],
    classTime: "9:30 AM - 10:45 AM",
    classLocation: "Building 2, Room 201",
    numStudents: 20,
    numNotifications: 0,
    attendanceRate: 99,
  ),
  const ProfessorClassWidget(
    className: "Software Engineering",
    classCode: "CS431",
    semester: "Spring 2023",
    daysOfWeek: ["Friday"],
    classTime: "11:00 AM - 12:15 PM",
    classLocation: "Building 1, Room 201",
    numStudents: 30,
    numNotifications: 2,
    attendanceRate: 0,
  ),
];
