// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_attendance_list_item_widget.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'ProfessorViewCoursePage')
class ProfessorViewCoursePage extends HookConsumerWidget {
  CourseModel course;
  ProfessorViewCoursePage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceDocsStream = ref.watch(attendanceDocsStreamProvider);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot<Object?>>(
          stream: attendanceDocsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data!.docs.reversed
                  .map((DocumentSnapshot document) {
                    final List<StudentAttendanceModel> students = [];
                    final data = document.data() as Map<String, dynamic>;
                    data.forEach((key, value) {
                      final student =
                          StudentAttendanceModel.fromJson(value, key);
                      students.add(student);
                    });
                    if (document.id == snapshot.data?.docs.last.id) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                            child: Text(
                              'Latest Attendance',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AttendanceListItemWidget(
                            totalNumberStudent: course.studentList.length,
                            students: students,
                            date: document.id,
                          ),
                          const SizedBox(height: 8.0),
                          snapshot.data!.docs.length > 1
                              ? const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                                  child: Text(
                                    'Previous Attendance',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    }
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
    );
  }
}
