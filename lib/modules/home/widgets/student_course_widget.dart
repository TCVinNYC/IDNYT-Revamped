import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:idnyt_revamped/shared/providers/nfc.provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCourseWidget extends HookConsumerWidget {
  const StudentCourseWidget({
    required this.documentSnapshot,
    Key? key,
  }) : super(key: key);

  final DocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CourseModel course =
        CourseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

    final hasSigned = ref.watch(hasStudentSignedInStreamProvider(course.id));
    final userData = ref.read(firestoreProvider).userData;

    final nfc = ref.read(nfcProvider);
    final nfcAvailable = useState(false);
    final nfcReading = useState(false);
    final nfcData = useState('');

    useEffect(() {
      nfc.checkNfcAvailability().then((available) {
        nfcAvailable.value = available;
      });
      return null;
    }, const []);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 4, 0),
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
                        course.professorPicture,
                        cacheWidth: 168,
                        cacheHeight: 168,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.professorFullName.replaceAll(' ', '\n'),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 0,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (course.isCourseOngoing())
                          const Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.green,
                          ),
                        const SizedBox(width: 4),
                        Text(
                          course.courseName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.school_rounded,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          course.courseCode,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Wrap(
                            spacing: 4,
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          course.courseTime,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            course.location,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (!course.isCourseOngoing()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Course has not started yet. Please come back later.'),
                                ),
                              );
                              return;
                            }
                            // Check if the student has already signed in for attendance
                            if (hasSigned.value!) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You have already signed in for attendance today!'),
                                ),
                              );
                              return;
                            }

                            if (nfcAvailable.value) {
                              try {
                                final nfcResult =
                                    await nfc.readNFC(nfcReading, nfcData);
                                debugPrint(nfcResult);
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                if (course.isCourseLocation(nfcResult)) {
                                  debugPrint(
                                      'Course location matches the NFC value!');

                                  final attendance = StudentAttendanceModel(
                                    name: userData.fullName,
                                    email: userData.email,
                                    profilePicture: userData.profilePicture,
                                    time: DateFormat('h:mm a')
                                        .format(DateTime.now()),
                                  );

                                  // Set selected course
                                  ref
                                      .read(selectedCourseProvider.notifier)
                                      .state = course.id;

                                  // Use the provider to mark attendance
                                  await ref.read(markStudentAttendanceProvider(
                                      attendance));

                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Welcome to class! Enjoy :D'),
                                    ),
                                  );
                                } else {
                                  debugPrint(
                                      'Course location does not match the NFC value.');
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Wrong Class Room!'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                debugPrint('Error during NFC session: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Class scanning session cancelled or failed.'),
                                  ),
                                );
                              }
                            }
                          },
                          icon: Icon(
                            Icons.contactless_rounded,
                            size: 20,
                            color: course.isCourseOngoing()
                                ? Colors.blue
                                : Colors.grey[400],
                          ),
                          tooltip: "Scan for Attendance",
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(selectedCourseProvider.notifier).state =
                                course.id;
                            AutoRouter.of(context)
                                .push(const CourseMessagingPage());
                          },
                          icon: const Icon(
                            Icons.messenger_rounded,
                            size: 20,
                            color: Colors.blue,
                          ),
                          tooltip: "Message Class",
                        ),
                        IconButton(
                          onPressed: () async {
                            bool result =
                                await _launchEmail(course.professorEmail);
                            if (!result) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Class scanning session cancelled or failed.'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.email,
                            size: 20,
                            color: Colors.blue,
                          ),
                          tooltip: "Email Professor",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _launchEmail(email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
      return true;
    } else {
      debugPrint('Could not launch email app');
      return false;
    }
  }
}
