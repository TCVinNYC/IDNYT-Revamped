import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

class ProfessorClassWidget extends ConsumerWidget {
  final DocumentSnapshot<Object?> documentSnapshot;

  const ProfessorClassWidget({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CourseModel course =
        CourseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
      child: InkWell(
        enableFeedback: true,
        onTap: () {
          ref.read(selectedCourseProvider.notifier).state = course.id;
          AutoRouter.of(context).push(
              ProfessorViewCoursePage(documentSnapshot: documentSnapshot));
        },
        child: Card(
          shadowColor: Colors.grey[600],
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.courseName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          course.courseCode,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          course.semester,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'Attendance: N/A%',
                          // 'Attendance: ${course.toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                const Text(
                  'Days:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    for (var day in course.courseDaysList)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Time:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  course.courseTime,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Location:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  course.location,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.group,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${course.studentList.length} students',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.notifications,
                          color: 1 > 0 ? Colors.red : Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'New messages',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
