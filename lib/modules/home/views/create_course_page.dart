import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/providers/create_course.provider.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';
import 'package:time_range/time_range.dart';
import 'package:chips_choice/chips_choice.dart';

class CreateCoursePage extends HookConsumerWidget {
  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const orange = Color(0xFFFE9A75);
    const dark = Color(0xFF333A47);
    TimeRangeResult? timeRange;

    // list of string options
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final className = ref.watch(classNameProvider);
    final classCode = ref.watch(classCodeProvider);
    final selectedSemester = ref.watch(selectedSemesterProvider);
    final classLocation = ref.watch(classLocationProvider);
    final selectedDays = ref.watch(selectedDaysProvider);
    final selectedTime = ref.watch(selectedTimeProvider);
    final selectedStudents = ref.watch(selectedStudentsProvider);

    final firebaseService = ref.read(firestoreProvider);
    final authService = ref.read(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Create Course',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                const Text(
                  'Course Information',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Class Name',
                    hintText: 'Enter class name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    ref.watch(classNameProvider.notifier).state = value;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Class Code',
                          hintText: 'Enter class code',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          ref.read(classCodeProvider.notifier).state = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Semester',
                          border: OutlineInputBorder(),
                        ),
                        enableFeedback: true,
                        elevation: 1,
                        autofocus: false,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Fall',
                            child: Text('Fall ${DateTime.now().year}'),
                          ),
                          DropdownMenuItem(
                            value: 'Spring',
                            child: Text('Spring ${DateTime.now().year}'),
                          ),
                          DropdownMenuItem(
                            value: 'Winter',
                            child: Text('Winter ${DateTime.now().year}'),
                          ),
                          DropdownMenuItem(
                            value: 'Summer',
                            child: Text('Summer ${DateTime.now().year}'),
                          ),
                        ],
                        onChanged: (value) {
                          value ??= '';
                          ref.read(selectedSemesterProvider.notifier).state =
                              value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    hintText: 'Enter class room location',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    ref.read(classLocationProvider.notifier).state = value;
                  },
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                const SizedBox(height: 10.0),
                const Text(
                  'Class Days',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ChipsChoice<String>.multiple(
                  value: selectedDays,
                  onChanged: (val) =>
                      ref.read(selectedDaysProvider.notifier).state = val,
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: days,
                    value: (i, v) => v,
                    label: (i, v) => v,
                    tooltip: (i, v) => v,
                  ),
                  spacing: 0,
                  choiceCheckmark: true,
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  choiceStyle: C2ChipStyle.outlined(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    height: 40,
                    foregroundStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                TimeRange(
                  fromTitle: const Text(
                    'From',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  toTitle: const Text(
                    'To',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  alwaysUse24HourFormat: false,
                  minimalTimeRange: 60,
                  titlePadding: 3,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: dark,
                  ),
                  activeTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: orange,
                  ),
                  borderColor: dark,
                  activeBorderColor: dark,
                  backgroundColor: Colors.transparent,
                  activeBackgroundColor: dark,
                  firstTime: const TimeOfDay(hour: 8, minute: 00),
                  lastTime: const TimeOfDay(hour: 23, minute: 00),
                  initialRange: timeRange,
                  timeStep: 15,
                  timeBlock: 15,
                  onRangeCompleted: (range) {
                    if (range?.start.format(context) == null) {
                      ref.read(selectedTimeProvider.notifier).state = '';
                    } else {
                      String time =
                          "${range?.start.format(context)} - ${range?.end.format(context)}";
                      ref.read(selectedTimeProvider.notifier).state = time;
                    }
                  },
                  onFirstTimeSelected: (startHour) {},
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Students',
                    hintText: 'Add student emails separated with a comma.',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    List<String> students =
                        value.replaceAll(RegExp(r"\s+"), "").split(',');
                    ref.read(selectedStudentsProvider.notifier).state =
                        students;
                  },
                ),
                const SizedBox(height: 25.0),
                RegularButtonWidget(
                  text: 'Submit',
                  onPressed: () {
                    if (className.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content: Text('Class Name field is empty')),
                      );
                    } else if (classCode.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content: Text('Class Code field is empty')),
                      );
                    } else if (selectedSemester.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content: Text('Selected Semester field is empty')),
                      );
                    } else if (classLocation.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content: Text('Class Location field is empty')),
                      );
                    } else if (selectedDays.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content:
                                Text('Please select days the class meets on.')),
                      );
                    } else if (selectedTime.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 2),
                            dismissDirection: DismissDirection.down,
                            elevation: 3,
                            showCloseIcon: true,
                            closeIconColor: Colors.redAccent,
                            content: Text(
                                'Please select a range of time for the class.')),
                      );
                      //   else if (selectedStudents.isEmpty) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //           content: Text('Class Code field is empty')),
                      //     );
                      // }
                    } else {
                      Map<String, dynamic> course = {
                        "professorEmail":
                            authService.currentUser!.email.toString(),
                        "professorFullName":
                            authService.currentUser!.displayName.toString(),
                        "professorPicture":
                            authService.currentUser!.photoURL.toString(),
                        "courseName": className,
                        "courseCode": classCode,
                        "semester": selectedSemester,
                        "location": classLocation,
                        "courseDaysList": selectedDays,
                        "courseTime": selectedTime,
                        "studentList": selectedStudents
                      };
                      firebaseService.setClassData(course).then(
                        (value) {
                          if (value == "Added") {
                            Navigator.of(context).pop();
                          } else if (value == "Error uploading to Firebase") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 2),
                                dismissDirection: DismissDirection.down,
                                elevation: 3,
                                showCloseIcon: true,
                                closeIconColor: Colors.redAccent,
                                content: Text(
                                    'There was a problem uploading your class. Please try again later.'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 2),
                                dismissDirection: DismissDirection.down,
                                elevation: 3,
                                showCloseIcon: true,
                                closeIconColor: Colors.redAccent,
                                content: Text('Something went wrong.'),
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
