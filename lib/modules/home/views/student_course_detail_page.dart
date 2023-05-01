import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'StudentCourseDetailPage')
class StudentCourseDetailPage extends StatelessWidget {
  final String courseName;
  final String syllabus;
  final String professorName;
  final String classTime;
  final String classLocation;
  final String classDay;

  const StudentCourseDetailPage({
    Key? key,
    required this.courseName,
    required this.syllabus,
    required this.professorName,
    required this.classTime,
    required this.classLocation,
    required this.classDay,
  }) : super(key: key);

  void _attendClass() {
    debugPrint("Trying to attend class");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(courseName),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Course Details and Timing:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                Text('Professor: $professorName'),
                const SizedBox(height: 8.0),
                Text('Class Time: $classTime'),
                const SizedBox(height: 8.0),
                Text('Class Location: $classLocation'),
                const SizedBox(height: 8.0),
                Text('Class Day: $classDay'),
                const SizedBox(height: 16.0),
                Text(
                  'Course Syllabus:',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // SizedBox(height: 8.0),
                Text(syllabus, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16.0),
                Text("Class Attendance 80%",
                    style: Theme.of(context).textTheme.bodyMedium),
                const LinearProgressIndicator(
                  value: 0.8, // Percentage of class attended
                  color: Colors.green,
                  semanticsLabel: 'Linear progress indicator',
                ),

                const SizedBox(height: 32.0),
                RegularButtonWidget(text: "Attend", onPressed: _attendClass)
              ],
            ),
          ),
        ));
  }
}
