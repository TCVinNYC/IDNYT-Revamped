import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AttendanceListItemWidget extends ConsumerWidget {
  final int totalNumberStudent;
  final String date;
  final List<StudentAttendanceModel> students;

  const AttendanceListItemWidget({
    Key? key,
    required this.totalNumberStudent,
    required this.date,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat inputFormat = DateFormat('M-d-yyyy');
    DateTime parsedDate = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat('MMMM d, yyyy');
    String formattedDate = outputFormat.format(parsedDate);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              formattedDate,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                students.length,
                (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage:
                            NetworkImage(students[index].profilePicture),
                      ),
                      const SizedBox(height: 8.0),
                      Text(students[index].name),
                      // const SizedBox(height: 4.0),
                      // Text(
                      //   students[index].time,
                      //   style: TextStyle(fontSize: 12.0),
                      // ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Present: ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      '${students.length}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Absent: ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      '${totalNumberStudent - students.length}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
