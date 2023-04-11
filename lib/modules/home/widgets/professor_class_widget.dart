import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfessorClassWidget extends ConsumerWidget {
  final String className;
  final String classCode;
  final String semester;
  final List<String> daysOfWeek;
  final String classTime;
  final String classLocation;
  final int numStudents;
  final int numNotifications;
  final double attendanceRate;

  const ProfessorClassWidget({
    Key? key,
    required this.className,
    required this.classCode,
    required this.semester,
    required this.daysOfWeek,
    required this.classTime,
    required this.classLocation,
    required this.numStudents,
    required this.numNotifications,
    required this.attendanceRate,
  }) : super(key: key);

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
                        className,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        classCode,
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
                        semester,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Attendance: ${attendanceRate.toStringAsFixed(2)}%',
                        style: const TextStyle(
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
                  for (var day in daysOfWeek)
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
                classTime,
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
                classLocation,
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
                        '$numStudents students',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: numNotifications > 0 ? Colors.red : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$numNotifications new',
                        style: const TextStyle(
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