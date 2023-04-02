import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: "SplashScreenPage")
class SplashScreenPage extends HookConsumerWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //for testing
    // AutoRouter.of(context).push(Route());
    final auth = ref.read(authServiceProvider);
    final authState = ref.watch(authStateProvider);

    if (authState.value != null) {
      debugPrint('Auth is vaild for ${auth.currentUser?.email}');
      if (auth.currentUser!.email!.endsWith("@nyit.edu")) {
        final userData = ref.watch(userDataProvider);
        final firestore = ref.watch(firestoreProvider);
        debugPrint('Auth ends in @NYIT.edu :D');
        if (userData.value?.role == 'student') {
          debugPrint('User has document and is a student');
          AutoRouter.of(context).push(const StudentHomePage());
        } else if ((userData.value?.role == 'professor')) {
          debugPrint('User has document and is a professor');
          AutoRouter.of(context).push(const ProfessorHomePage());
        } else if (userData.value?.role == 'admin') {
          debugPrint('User has document and is an admin');
          AutoRouter.of(context).push(const AdminHomePage());
        } else if (userData.value?.role == "") {
          debugPrint(
              'User does NOT have a document, they will become a student unless changed');
          firestore.createAccount();
          AutoRouter.of(context).push(const StudentHomePage());
        }
      } else {
        AutoRouter.of(context).push(const ErrorPage());
      }
    } else {
      // debugPrint('Auth is broken, going back to LoginPage');
      // auth.signOut();
      AutoRouter.of(context).push(LoginPage());
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'IDNYT',
                style: TextStyle(
                  fontFamily: 'SnowburstOne',
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
