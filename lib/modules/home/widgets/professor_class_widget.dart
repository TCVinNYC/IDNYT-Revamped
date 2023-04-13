import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';

class ProfessorClassWidget extends ConsumerWidget {
  final CourseModel course;

  const ProfessorClassWidget({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
      child: Card(
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
                        '0',
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
                        '1 new',
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
    );
  }
}



// old stuff
// class ProfessorClassWidget extends StatelessWidget {
//   final String className;
//   final String semester;
//   final List<String> classDays;
//   final String classTime;
//   final String classLocation;
//   final int numberOfStudents;
//   final int notificationCount;
//   final VoidCallback sendMessageCallback;

//   ProfessorClassWidget({
//     required this.className,
//     required this.semester,
//     required this.classDays,
//     required this.classTime,
//     required this.classLocation,
//     required this.numberOfStudents,
//     required this.notificationCount,
//     required this.sendMessageCallback,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Icon(Icons.school),
//         title: Text(className),
//         subtitle: Text(
//             '$semester\n${classDays.join(", ")}\n$classTime\n$classLocation'),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.group),
//             SizedBox(width: 5),
//             Text(numberOfStudents.toString()),
//             SizedBox(width: 20),
//             notificationCount > 0
//                 ? InkWell(
//                     onTap: sendMessageCallback,
//                     child: Stack(
//                       children: [
//                         Icon(Icons.notifications_active),
//                         Positioned(
//                           right: 0,
//                           child: Container(
//                             padding: EdgeInsets.all(1),
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             constraints: BoxConstraints(
//                               minWidth: 12,
//                               minHeight: 12,
//                             ),
//                             child: Text(
//                               notificationCount.toString(),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 8,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : InkWell(
//                     onTap: sendMessageCallback,
//                     child: Icon(Icons.message),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// List<Widget> professorClasses = [
  // ProfessorClassWidget(
  //   className: 'Introduction to Computer Science',
  //   semester: 'Spring 2023',
  //   classDays: ['Monday', 'Wednesday', 'Friday'],
  //   classTime: '10:00 AM - 12:00 PM',
  //   classLocation: 'Room 101',
  //   numberOfStudents: 25,
  //   notificationCount: 2,
  //   sendMessageCallback: () {
  //     // Implement sending a message to the students for this class.
  //   },
  // ),
  // ProfessorClassWidget(
  //   className: 'Data Structures and Algorithms',
  //   semester: 'Spring 2023',
  //   classDays: ['Tuesday', 'Thursday'],
  //   classTime: '2:00 PM - 4:00 PM',
  //   classLocation: 'Room 102',
  //   numberOfStudents: 30,
  //   notificationCount: 0,
  //   sendMessageCallback: () {
  //     // Implement sending a message to the students for this class.
  //   },
  // ),
// ];