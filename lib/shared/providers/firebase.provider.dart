import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/services/firebase.service.dart';

final firestoreProvider = Provider<FirebaseService>((ref) {
  // final User? authUser = ref.read(authStateProvider).value;
  final User? authUser = ref.watch(authServiceProvider).currentUser;
  return FirebaseService(authUser: authUser);
});

// final userDataProvider = FutureProvider<UserModel?>((ref) {
//   return ref.read(firestoreProvider).userData;
// });

final userDataStreamProvider = StreamProvider<UserModel?>((ref) {
  return ref.read(firestoreProvider).userDataStream;
});

List<String> semesters = ['Fall', 'Spring', 'Summer', 'Winter'];

final selectedYearProvider =
    StateProvider((ref) => DateTime.now().year.toString());

final selectedSemesterProvider = StateProvider((ref) => 'Spring');

final courseDataStreamProvider =
    Provider<Stream<QuerySnapshot<Object?>>>((ref) {
  String year = ref.watch(selectedYearProvider);
  String semester = ref.watch(selectedSemesterProvider);

  return ref.read(firestoreProvider).courseDataStream(year, semester);
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


// return attendanceStream.map((docSnapshot) {
//     if (docSnapshot.exists) {
//       final data = docSnapshot.data();
//       final List<StudentAttendanceModel> students = [];

//       data.forEach((email, studentData) {
//         final student = StudentAttendanceModel.fromJson(studentData, email);
//         students.add(student);
//       });

//       return students;
//     } else {
//       return [];
//     }
//   });