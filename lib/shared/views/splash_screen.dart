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
    final authState = ref.watch(authStateProvider);
    final userData = ref.watch(userDataProvider);
    final firestore = ref.read(firestoreProvider);

    if (authState.value != null) {
      if (ref
          .read(authServiceProvider)
          .currentUser!
          .email!
          .endsWith("@nyit.edu")) {
        if (userData.value?.role == 'student') {
          AutoRouter.of(context).push(const StudentHomePage());
        } else if ((userData.value?.role == 'professor')) {
          AutoRouter.of(context).push(const ProfessorHomePage());
        } else if (userData.value?.role == 'admin') {
          AutoRouter.of(context).push(const AdminHomePage());
        } else if (userData.value?.role == "") {
          firestore.createAccount();
        }
      } else {
        AutoRouter.of(context).push(const ErrorPage());
      }
    } else {
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
