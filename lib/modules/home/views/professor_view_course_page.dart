// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_attendance_list_item_widget.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'ProfessorViewCoursePage')
class ProfessorViewCoursePage extends HookConsumerWidget {
  final DocumentSnapshot<Object?> documentSnapshot;
  const ProfessorViewCoursePage({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceDocsStream = ref.watch(attendanceCollectionStreamProvider);
    CourseModel course =
        CourseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.courseName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Edit Course",
            icon: const Icon(Icons.mode_edit),
            enableFeedback: true,
            onPressed: () {
              // AutoRouter.of(context).push(const CreateCoursePage());
            },
          ),
        ],
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
                            documentSnapshot: document,
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
                      documentSnapshot: document,
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
