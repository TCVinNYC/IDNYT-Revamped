// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/views/create_course_page.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_attendance_list_item_widget.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_class_widget.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'ProfessorViewCoursePage')
class ProfessorViewCoursePage extends HookConsumerWidget {
  CourseModel course;
  ProfessorViewCoursePage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceDocsStream = ref.watch(attendanceDocsStreamProvider);
    // final selectedCourse = ref.watch(selectedCourseProvider);
    // final selectedYear = ref.watch(selectedYearProvider);
    // final selectedSemester = ref.watch(selectedSemesterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.courseName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Latest Attendance',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Date:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'August 23, 2022',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Time:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            course.courseTime,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Present:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '28',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Absent:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '3',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Previous Attendances',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 300,
                child: SafeArea(
                  child: StreamBuilder<QuerySnapshot<Object?>>(
                    stream: attendanceDocsStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print("error");
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print("waiting");
                        return const CircularProgressIndicator();
                      }
                      final List<StudentAttendanceModel> students = [];
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                              final data =
                                  document.data() as Map<String, dynamic>;

                              data.forEach((key, value) {
                                final student =
                                    StudentAttendanceModel.fromJson(value, key);
                                students.add(student);
                              });

                              return AttendanceListItemWidget(
                                totalNumberStudent: course.studentList.length,
                                students: students,
                                date: document.id,
                              );
                            })
                            .toList()
                            .cast(),
                      );
                    },
                  ),
                ),
              ),

              // _buildAttendanceListItem(
              //   'August 16, 2022',
              //   29,
              //   2,
              //   [
              //     'https://randomuser.me/api/portraits/women/24.jpg',
              //     'https://randomuser.me/api/portraits/men/11.jpg',
              //     'https://randomuser.me/api/portraits/women/49.jpg',
              //     'https://randomuser.me/api/portraits/men/45.jpg',
              //     'https://randomuser.me/api/portraits/women/16.jpg',
              //     'https://randomuser.me/api/portraits/men/92.jpg',
              //   ],
              //   [
              //     'Alice',
              //     'Bob',
              //     'Cathy',
              //     'David',
              //     'Ella',
              //     'Frank',
              //   ],
              //   [
              //     '9:02 AM',
              //     '9:05 AM',
              //     '9:10 AM',
              //     '9:14 AM',
              //     '9:15 AM',
              //     '9:20 AM',
              //   ],
              // ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
