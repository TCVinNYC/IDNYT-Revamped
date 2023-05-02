import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idnyt_revamped/modules/home/widgets/student_course_widget.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:nfc_manager/nfc_manager.dart';

@RoutePage(name: 'StudentHomePage')
class StudentHomePage extends HookConsumerWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseDataStream = ref.watch(studentCourseDataStreamProvider);
    final nfcAvailable = useState(false);

    final writing = useState(false);

    useEffect(() {
      print('useffect');
      _checkNfcAvailability().then((available) {
        print(available);
        nfcAvailable.value = available;
      });
    }, const []);

    final reading = useState(false);
    final nfcData = useState('');

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 1,
        backgroundColor: isDarkMode ? const Color(0x0001d97c) : Colors.amber,
        title: const Text(
          'My Courses',
        ),
      ),
      body: Center(
        child: SafeArea(
          child: StreamBuilder<QuerySnapshot<Object?>>(
            stream: courseDataStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      return StudentCourseWidget(
                        documentSnapshot: document,
                      );
                    })
                    .toList()
                    .cast(),
              );
            },
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
      print("Error checking NFC availability: $e");
    }
    return isAvailable;
  }
}
