import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.userChanges();
  User? get currentUser => _auth.currentUser;

  Future<bool> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process, return false
      if (googleUser == null) {
        return false;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return true
      await _auth.signInWithCredential(credential);
      debugPrint('Signed In');
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return false;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  Future<void> refreshAuth() async {
    try {
      debugPrint('Refreshing Auth');
      await currentUser?.reload();
      debugPrint('Auth Refresh Successful for ${currentUser?.email}');
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

  Future<void> deleteUser() async {
    try {
      debugPrint('Signing You Out');
      await _auth.currentUser!.delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
