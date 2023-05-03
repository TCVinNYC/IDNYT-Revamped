import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/course.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:nfc_manager/nfc_manager.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class StudentCourseWidget extends HookConsumerWidget {
  const StudentCourseWidget({
    required this.documentSnapshot,
    Key? key,
  }) : super(key: key);

  final DocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nfcAvailable = useState(false);
    final reading = useState(false);
    final writing = useState(false);
    final nfcData = useState('');

    useEffect(() {
      _checkNfcAvailability().then((available) {
        nfcAvailable.value = available;
      });
    }, const []);

    CourseModel course =
        CourseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

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
                    Text(
                      course.courseName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                            if (nfcAvailable.value) {
                              _readNFC(reading, nfcData);
                            }
                          },
                          icon: const Icon(
                            Icons.contactless_rounded,
                            size: 20,
                            color: Colors.blue,
                          ),
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
                        ),
                        IconButton(
                          onPressed: () {
                            // Send email to professor
                          },
                          icon: const Icon(
                            Icons.email,
                            size: 20,
                            color: Colors.blue,
                          ),
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

  Future<bool> _checkNfcAvailability() async {
    bool isAvailable = false;
    try {
      isAvailable = await NfcManager.instance.isAvailable();
    } catch (e) {
      debugPrint("Error checking NFC availability: $e");
    }
    return isAvailable;
  }

  Future<void> _readNFC(
      ValueNotifier<bool> reading, ValueNotifier<String> nfcData) async {
    reading.value = true;

    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        final ndefTag = Ndef.from(tag);
        if (ndefTag != null && ndefTag.cachedMessage != null) {
          final message = ndefTag.cachedMessage!;
          if (message.records.isNotEmpty) {
            final record = message.records.first;
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown) {
              if (record.payload.first == 0x02) {
                final languageCodeAndContentBytes =
                    record.payload.skip(1).toList();
                final languageCodeAndContentText =
                    utf8.decode(languageCodeAndContentBytes);
                final payload = languageCodeAndContentText.substring(2);
                nfcData.value = payload;
              }
            }
          }
        }
        NfcManager.instance.stopSession();
        reading.value = false;
      },
      onError: (error) async {
        debugPrint('Error reading NFC tag: $error');

        // Stop the session and update the reading value
        NfcManager.instance.stopSession();
        reading.value = false;
      },
      pollingOptions: {
        NfcPollingOption.iso14443,
        NfcPollingOption.iso15693,
      },
    );
  }
}
