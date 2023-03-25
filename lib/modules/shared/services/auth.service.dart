import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.userChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(credential);
      debugPrint('Signed In');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> refreshAuth() async {
    try {
      await currentUser?.reload();
    } catch (e) {
      debugPrint(e.toString());
      await _auth.signOut();
    }
  }

  Future<void> signOut() async {
    try {
      debugPrint('Signing You Out');
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
