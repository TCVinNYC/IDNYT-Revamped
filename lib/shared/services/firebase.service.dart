import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:idnyt_revamped/shared/models/user.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseService({required this.authUser});
  final User? authUser;
  late UserModel currentUser;

  // Future<UserModel?> get userData => checkUserData();
  Stream<UserModel> get userDataStream => getUserData();

  Future<void> checkUserData() async {
    final docRef = _db.collection("users").doc(authUser?.email);
    var doc = await docRef.get();
    if (doc.exists) {
      debugPrint("document found ${authUser?.email}");
      UserModel userData =
          UserModel.fromJson(doc.data() as Map<String, dynamic>);
      currentUser = userData;
    } else if (authUser?.email != null) {
      debugPrint("no document for ${authUser?.email}");
      UserModel? tempUser = await createAccount();
      if (tempUser != null) {
        currentUser = tempUser;
      } else {
        debugPrint("something went wrong when checking for your document");
      }
    }
  }

  // make a user variable that store user's doc data
  // have it update with firestore
  // use the same variable to update their data syncronisly

  // get current user's UID / email to get their user document

  // Stream<User?> get authStateChanges => _auth.userChanges();
  // User? get currentUser => _auth.currentUser;

  // Future<void> setUserData() async {
  //   try {
  //     final user =
  //   } on PlatformException catch (e) {
  //     debugPrint(e.message);
  //   }
  // }

  Future<UserModel?> createAccount() async {
    debugPrint('Creating Account for ${authUser?.email}');
    try {
      final userDocument = <String, dynamic>{
        "email": authUser?.email,
        "role": "student",
        "fullName": authUser?.displayName,
        "active": true,
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
      currentUser = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      return currentUser;
    });
    // if (userEmail != null) {
    //   final docRef = _db.collection("users").doc("user_email");
    //   return docRef
    //       .snapshots()
    //       .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>));
    // } else {
    //   return const Stream.empty();
    // }
  }
}
