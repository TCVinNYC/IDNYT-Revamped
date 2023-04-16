import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/views/create_course_page.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_class_widget.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'ProfessorViewCoursePage')
class ProfessorViewCoursePage extends HookConsumerWidget {
  const ProfessorViewCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
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
                      Text(
                        'Latest Attendance',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '9:00 AM - 10:30 AM',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
              SizedBox(height: 16.0),
              Text(
                'Previous Attendances',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              _buildAttendanceListItem(
                'August 16, 2022',
                '9:00 AM - 10:30 AM',
                29,
                2,
                [
                  'https://randomuser.me/api/portraits/women/24.jpg',
                  'https://randomuser.me/api/portraits/men/11.jpg',
                  'https://randomuser.me/api/portraits/women/49.jpg',
                  'https://randomuser.me/api/portraits/men/45.jpg',
                  'https://randomuser.me/api/portraits/women/16.jpg',
                  'https://randomuser.me/api/portraits/men/92.jpg',
                ],
                [
                  'Alice',
                  'Bob',
                  'Cathy',
                  'David',
                  'Ella',
                  'Frank',
                ],
                [
                  '9:02 AM',
                  '9:05 AM',
                  '9:10 AM',
                  '9:14 AM',
                  '9:15 AM',
                  '9:20 AM',
                ],
              ),
              SizedBox(height: 16.0),
              _buildAttendanceListItem(
                'August 9, 2022',
                '9:00AM - 10:30 AM',
                30,
                1,
                [
                  'https://randomuser.me/api/portraits/women/52.jpg',
                  'https://randomuser.me/api/portraits/men/63.jpg',
                  'https://randomuser.me/api/portraits/women/95.jpg',
                  'https://randomuser.me/api/portraits/men/32.jpg',
                  'https://randomuser.me/api/portraits/women/19.jpg',
                ],
                [
                  'Grace',
                  'John',
                  'Olivia',
                  'Mark',
                  'Lily',
                ],
                [
                  '9:00 AM',
                  '9:01 AM',
                  '9:03 AM',
                  '9:06 AM',
                  '9:10 AM',
                ],
              ),
              SizedBox(height: 16.0),
              _buildAttendanceListItem(
                'August 2, 2022',
                '9:00 AM - 10:30 AM',
                28,
                3,
                [
                  'https://randomuser.me/api/portraits/women/73.jpg',
                  'https://randomuser.me/api/portraits/men/22.jpg',
                  'https://randomuser.me/api/portraits/women/68.jpg',
                  'https://randomuser.me/api/portraits/men/77.jpg',
                  'https://randomuser.me/api/portraits/women/87.jpg',
                  'https://randomuser.me/api/portraits/men/19.jpg',
                ],
                [
                  'Emma',
                  'Luke',
                  'Chloe',
                  'Eric',
                  'Mia',
                  'Owen',
                ],
                [
                  '9:01 AM',
                  '9:05 AM',
                  '9:07 AM',
                  '9:10 AM',
                  '9:11 AM',
                  '9:15 AM',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceListItem(
    String date,
    String time,
    int presentCount,
    int absentCount,
    List<String> studentProfilePics,
    List<String> studentNames,
    List<String> joinTimes,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 16.0),
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
                      SizedBox(height: 8.0),
                      Text(studentNames[index]),
                      SizedBox(height: 4.0),
                      Text(
                        joinTimes[index],
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Present:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '$presentCount',
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Absent:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      '$absentCount',
                      style: TextStyle(fontSize: 16.0),
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
