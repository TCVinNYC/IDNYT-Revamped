import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/widgets/professor_class_widget.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'ProfessorHomePage')
class ProfessorHomePage extends HookConsumerWidget {
  const ProfessorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> semesters = ['Fall', 'Spring', 'Summer', 'Winter'];
    List<String> yearData = ref.read(firestoreProvider).yearDataStream();
    final courseDataStream = ref.watch(professorCourseDataStreamProvider);
    final selectedYear = ref.watch(selectedYearProvider);
    final selectedSemester = ref.watch(selectedSemesterProvider);

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0x0001d97c) : Colors.amber,
      appBar: AppBar(
        scrolledUnderElevation: 1,
        backgroundColor: isDarkMode ? const Color(0x0001d97c) : Colors.amber,
        title: const Text(
          'My Courses',
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.calendar_month_rounded),
            tooltip: "Select Year",
            elevation: 2,
            onSelected: (String value) {
              ref.read(selectedYearProvider.notifier).state = value;
            },
            itemBuilder: (BuildContext context) {
              return yearData.map(
                (String year) {
                  return CheckedPopupMenuItem<String>(
                    checked: year == selectedYear ? true : false,
                    padding: const EdgeInsets.all(0),
                    value: year,
                    child: Text(year),
                  );
                },
              ).toList();
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.school_rounded),
            tooltip: "Select Semester",
            onSelected: (String value) {
              ref.read(selectedSemesterProvider.notifier).state = value;
            },
            itemBuilder: (BuildContext context) {
              return semesters.map((String semester) {
                return CheckedPopupMenuItem<String>(
                  checked: semester == selectedSemester ? true : false,
                  padding: const EdgeInsets.all(0),
                  value: semester,
                  child: Text(semester),
                );
              }).toList();
            },
          ),
          IconButton(
            tooltip: "Create New Course",
            icon: const Icon(Icons.add),
            enableFeedback: true,
            onPressed: () {
              AutoRouter.of(context).push(const CreateCoursePage());
            },
          ),
        ],
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
                      return ProfessorClassWidget(
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
}
