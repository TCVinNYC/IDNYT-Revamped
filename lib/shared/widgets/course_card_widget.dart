import 'package:flutter/material.dart';

import '../../modules/home/views/student_course_detail_page.dart';

class StudentCourseCard extends StatelessWidget {
  final String courseName;
  final String professorName;
  final String classTime;
  final String classLocation;
  final String classDay;

  get courseDays => [1, 0, 0, 0, 0, 1, 1];

  const StudentCourseCard({
    required this.courseName,
    required this.professorName,
    required this.classTime,
    required this.classLocation,
    required this.classDay,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 205,
        child: Card(
            elevation: 2.0,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const StudentCourseDetailPage(
                            courseName: 'Introduction to Flutter',
                            professorName: 'John Doe',
                            classTime: '9:00 AM - 10:30 AM',
                            syllabus: '''
The general principles of modern programming language design: Imperative (as exemplified by Pascal, C and Ada), functional (Lisp), and logical (Prolog) languages. Data management, abstract data types, packages, and object-oriented languages (Ada, C + +). Control structures. Syntax and formal semantics. While some implementation techniques are mentioned, the primary thrust of the course is concerned with the abstract semantics of programming languages. Equivalent to: CSCI 651''',
                            classLocation: 'Room 101',
                            classDay: 'Monday',
                          )),
                );
              },
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courseName,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Professor: $professorName',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Time: $classTime',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Location: $classLocation',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Day: ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                courseDays.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      [
                                        'M',
                                        'T',
                                        'W',
                                        'Th',
                                        'F',
                                        'Sa',
                                        'Su'
                                      ][index],
                                      style: TextStyle(
                                        color: courseDays[index] == 1
                                            ? Colors.green
                                            : Colors.grey,
                                        fontWeight: courseDays[index] == 1
                                            ? FontWeight.w900
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.nfc),
                                tooltip: 'Increase volume by 10',
                                iconSize: 50,
                                onPressed: () {
                                  // setState(() {
                                  //   _volume += 10;
                                  // });
                                },
                              ),
                              const Text('Tap to Attend',
                                  textAlign: TextAlign.center),
                            ],
                          ))
                    ],
                  )),
            )));
  }
}
