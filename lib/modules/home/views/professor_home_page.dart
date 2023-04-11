// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/views/create_course_page.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_class_widget.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';

@RoutePage(name: 'ProfessorHomePage')
class ProfessorHomePage extends HookConsumerWidget {
  UserModel userData;
  ProfessorHomePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: const [
            Icon(Icons.book),
            SizedBox(width: 10),
            Text(
              'My Courses',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.filter_list),
                    SizedBox(width: 10),
                    Text('Filter'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: const [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text('Select Semester'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                // Filter action
                // TODO: Implement filter functionality
              } else if (value == 2) {
                // Select Semester action
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text('Select Semester'),
                //     content: DropdownButton<String>(
                //       value: semesters.first,
                //       onChanged: (value) => onSemesterSelected(value!),
                //       items: semesters
                //           .map((semester) => DropdownMenuItem<String>(
                //                 value: semester,
                //                 child: Text(semester),
                //               ))
                //           .toList(),
                //     ),
                //   ),
                // );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateCoursePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            children: professorClasses,
          ),
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
