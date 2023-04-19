import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';

@RoutePage(name: 'AttendanceDetailPage')
class AttendanceDetailPage extends HookConsumerWidget {
  final DocumentSnapshot<Object?> documentSnapshot;

  const AttendanceDetailPage({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<StudentAttendanceModel> students = [];
    final studentData = documentSnapshot.data() as Map<String, dynamic>;
    studentData.forEach((key, value) {
      final student = StudentAttendanceModel.fromJson(value, key);
      students.add(student);
    });

    DateFormat inputFormat = DateFormat('M-d-yyyy');
    DateTime parsedDate = inputFormat.parse(documentSnapshot.id);
    DateFormat outputFormat = DateFormat('MMMM d, yyyy');
    String formattedDate = outputFormat.format(parsedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(formattedDate),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            final student = students[index];
            return Dismissible(
              key: Key(student.toString()),
              direction: DismissDirection.endToStart,
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                        'Are you sure you want to delete this student?',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (DismissDirection direction) {
                // Remove the student from the list
                // setState(() {
                //   students.removeAt(index);
                // });
                // Show a snackbar to confirm deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${student.name} deleted'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        // setState(() {
                        //   students.insert(index, student);
                        // });
                      },
                    ),
                  ),
                );
              },
              background: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.red,
                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
              ),
              child: StudentListItem(student: student),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: implement add student
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StudentListItem extends StatelessWidget {
  const StudentListItem({
    super.key,
    required this.student,
  });

  final StudentAttendanceModel student;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 5.0),
                CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.network(
                      student.profilePicture,
                      cacheWidth: 168,
                      cacheHeight: 168,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        student.email,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Time of Join: ${student.time}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
