import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/home/providers/semester.provider.dart';
import 'package:idnyt_revamped/modules/models/student_attendance.model.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/services/firebase.service.dart';

final firestoreProvider = Provider<FirebaseService>((ref) {
  final User? authUser = ref.watch(authServiceProvider).currentUser;
  return FirebaseService(authUser: authUser);
});

final userDataStreamProvider = StreamProvider<UserModel?>((ref) {
  return ref.read(firestoreProvider).userDataStream;
});

List<String> semesters = ['Fall', 'Spring', 'Summer', 'Winter'];

final selectedYearProvider =
    StateProvider((ref) => DateTime.now().year.toString());

final selectedSemesterProvider = StateProvider((ref) {
  if (ref.read(firestoreProvider).userData.role == 'student') {
    return ref.read(currentSemesterProvider);
  }
  return 'Spring';
});

final professorCourseDataStreamProvider =
    Provider<Stream<QuerySnapshot<Object?>>>((ref) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(selectedSemesterProvider);

  return ref.read(firestoreProvider).professorCourseDataStream(year, semester);
});

// final hasStudentSignedInProvider =
//     FutureProvider.family<bool, String>((ref, courseId) {
//   String year = ref.watch(selectedYearProvider);
//   String semester = ref.watch(currentSemesterProvider);
//   String date = DateFormat('M-d-yyyy').format(DateTime.now());

//   return ref
//       .read(firestoreProvider)
//       .hasStudentSignedIn(year, semester, courseId, date);
// });

final hasStudentSignedInStreamProvider =
    StreamProvider.family<bool, String>((ref, courseId) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(currentSemesterProvider);
  String date = DateFormat('M-d-yyyy').format(DateTime.now());

  return ref
      .read(firestoreProvider)
      .hasStudentSignedInStream(year, semester, courseId, date);
});

final markStudentAttendanceProvider =
    Provider.family<Future<void>, StudentAttendanceModel>((ref, attendance) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(currentSemesterProvider);
  String course = ref.watch(selectedCourseProvider);
  String date = DateFormat('M-d-yyyy').format(DateTime.now());

  return ref
      .read(firestoreProvider)
      .markStudentAttendance(year, semester, course, date, attendance);
});

final studentCourseDataStreamProvider =
    Provider<Stream<QuerySnapshot<Object?>>>((ref) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(selectedSemesterProvider);

  return ref.read(firestoreProvider).studentCourseDataStream(year, semester);
});

final selectedCourseProvider = StateProvider((ref) => '');

final attendanceCollectionStreamProvider =
    Provider<Stream<QuerySnapshot<Object?>>>((ref) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(selectedSemesterProvider);
  String course = ref.watch(selectedCourseProvider);

  return ref
      .read(firestoreProvider)
      .attendanceCollectionDataStream(year, semester, course);
});

final courseMessagesCollectionStreamProvider =
    Provider<Stream<QuerySnapshot<Object?>>>((ref) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(selectedSemesterProvider);
  String course = ref.watch(selectedCourseProvider);

  return ref
      .read(firestoreProvider)
      .courseMessagesCollectionDataStream(year, semester, course);
});
