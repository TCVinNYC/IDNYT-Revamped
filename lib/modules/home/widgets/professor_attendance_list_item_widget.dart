import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/providers/attendance.provider.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AttendanceListItemWidget extends HookConsumerWidget {
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
    final uniqueKey = useMemoized(() => UniqueKey());

    DateFormat inputFormat = DateFormat('M-d-yyyy');
    DateTime parsedDate = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat('MMMM d, yyyy');
    String formattedDate = outputFormat.format(parsedDate);

    bool showTime = ref.watch(showTimeProvider(uniqueKey));

    return InkWell(
      enableFeedback: true,
      onLongPress: () {
        ref.read(showTimeProvider(uniqueKey).notifier).state = !showTime;
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  students.length,
                  (index) {
                    List<String> nameParts = students[index].name.split(' ');
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.network(
                              students[index].profilePicture,
                              cacheWidth: 168,
                              cacheHeight: 168,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        AnimatedCrossFade(
                            firstChild:
                                Text('${nameParts[0]} ${nameParts[1][0]}'),
                            secondChild: Text(students[index].time),
                            crossFadeState: showTime
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 300)),
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
      ),
    );
  }
}
