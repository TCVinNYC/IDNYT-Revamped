import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttendanceListItemWidget extends ConsumerWidget {
  // total_num_students - from the course variable

  // Date
  // while pulling from the document data for who is here by email + time
  // this would require me to pull twice though for only name + profile pic to be separate

  const AttendanceListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              date,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                studentProfilePics.length,
                (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 24.0,
                        backgroundImage:
                            NetworkImage(studentProfilePics[index]),
                      ),
                      const SizedBox(height: 8.0),
                      Text(studentNames[index]),
                      const SizedBox(height: 4.0),
                      // Text(
                      //   joinTimes[index],
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
                      '$presentCount',
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
                      '$absentCount',
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
