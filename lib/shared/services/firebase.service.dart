import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseService({required this.authUser});
  final User? authUser;
  late UserModel userData;

  FirebaseFirestore get firestore => _db;
  Stream<UserModel> get userDataStream => getUserData();

  Stream<QuerySnapshot> courseDataStream(String year, String semester) {
    return _db
        .collection('courses')
        .doc(year)
        .collection(semester)
        .where("professorEmail", isEqualTo: userData.email)
        .snapshots();
  }

  Stream<QuerySnapshot> attendanceCollectionDataStream(
      String year, String semester, String course) {
    return _db
        .collection('courses')
        .doc(year)
        .collection(semester)
        .doc(course)
        .collection('attendance')
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> attendanceDocDataStream(
      String year, String semester, String course, String date) {
    return _db
        .collection('courses')
        .doc(year)
        .collection(semester)
        .doc(course)
        .collection('attendance')
        .doc(date)
        .snapshots();
  }

  Stream<QuerySnapshot> courseMessagesCollectionDataStream(
      String year, String semester, String course) {
    return _db
        .collection('courses')
        .doc(year)
        .collection(semester)
        .doc(course)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
  }

  Future<void> sendCourseMessage(
      String year, String semester, String course, String message) {
    final documentMessage = {
      'name': userData.fullName,
      'email': userData.email,
      'profilePicture': userData.profilePicture,
      'message': message,
      'time': Timestamp.now(),
    };
    return _db
        .collection('courses')
        .doc(year)
        .collection(semester)
        .doc(course)
        .collection('messages')
        .add(documentMessage);
  }

  List<String> yearDataStream() {
    List<String> years = [];
    _db.collection('courses').get().then(
      (value) {
        for (var element in value.docs) {
          years.add(element.data().values.first);
        }
      },
    );
    return years;
  }

  Future<void> checkUserData() async {
    final docRef = _db.collection("users").doc(authUser?.email);
    var doc = await docRef.get();
    debugPrint("Checking for ${authUser?.email} data");
    if (doc.exists) {
      debugPrint("document found ${authUser?.email}");
      UserModel currentUser =
          UserModel.fromJson(doc.data() as Map<String, dynamic>);
      userData = currentUser;
    } else if (authUser?.email != null) {
      debugPrint("no document for ${authUser?.email}");
      UserModel? currentUser = await createAccount();
      if (currentUser != null) {
        userData = currentUser;
      } else {
        debugPrint("something went wrong when checking for your document");
      }
    }
  }

  Future<UserModel?> createAccount() async {
    debugPrint('Creating Account for ${authUser?.email}');
    try {
      final userDocument = <String, dynamic>{
        "email": authUser?.email,
        "role": "student",
        "fullName": authUser?.displayName,
        "profilePicture": authUser?.photoURL,
      };
      debugPrint('Created Doc for ${authUser?.email}');
      _db.collection("users").doc(authUser?.email).set(userDocument);
      debugPrint("Added user ${authUser?.email} to Firebase\n");
      return UserModel.fromJson(userDocument);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Stream<UserModel> getUserData() {
    final docRef = _db.collection("users").doc(authUser?.email);
    debugPrint('Getting Doc for ${authUser?.email}');
    return docRef.snapshots().map((doc) {
      final data = doc.data();
      if (data == null) {
        throw Exception("Document doesn't exist");
      }
      return UserModel.fromJson(data);
    });
  }

  Future<String> setClassData(classData) async {
    try {
      String currentYear = DateTime.now().year.toString();
      DocumentReference courseYearDocumentReference =
          _db.collection('courses').doc(currentYear);
      CollectionReference currentSemesterCollectionReference = _db
          .collection("courses")
          .doc(currentYear)
          .collection(classData['semester']);

      await courseYearDocumentReference.get().then((yearDocument) async => {
            if (!yearDocument.exists)
              debugPrint("$currentYear document doesn't exist. Creating now."),
            await courseYearDocumentReference.set({'year': currentYear})
          });

      await currentSemesterCollectionReference.add(classData).then(
        (documentSnapshot) {
          debugPrint(
              "Added Data for ${authUser?.email} with ID: ${documentSnapshot.id}");
          documentSnapshot.update({
            'id': documentSnapshot.id,
          });
          debugPrint("Added Document ID field to document.");
          return "Added";
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      return "Error uploading to Firebase";
    }
    return "Other Error";
  }
}
