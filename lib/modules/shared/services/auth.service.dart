import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/constants/hive_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idnyt/modules/shared/providers/auth.provider.dart';

class AuthService {
  late bool _isAuthenticated;

  AuthService(WidgetRef ref) {
    final authenticated = ref.watch(isAuthenticatedProvider);

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null || authenticated == false) {
        _isAuthenticated = false;
        debugPrint('User is not signed in!');
      } else {
        _isAuthenticated = true;
        debugPrint('User is signed in!');
      }
    });

    // if (Hive.isBoxOpen(loginInfoBox)) {
    //   final googleCred = Hive.box(loginInfoBox).get(googleCredentialKey) as String?;
    //   final userInstance = Hive.box(loginInfoBox).get(googleCredentialKey) as String?;
    //   if (googleCred != null && userInstance !=null ) {
    //     FirebaseAuth.instance.userChanges().listen((User? user) {
    //       if (user == null) {
    //         print('User is currently signed out!');
    //       } else {
    //         print('User is signed in!');
    //       }
    //     });
    //   }
    // } else {
    //   debugPrint("Cannot init AuthService endpoint, userInfoBox not open yet.");
    // }
  }

  Future<UserCredential> signInWithGoogle(WidgetRef ref) async {
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
    UserCredential cred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    ref.read(isAuthenticatedProvider.notifier).state = true;
    return cred;
  }

  get currentAuth => _isAuthenticated;
}
