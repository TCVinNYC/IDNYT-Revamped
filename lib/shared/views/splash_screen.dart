import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage(name: "SplashScreenPage")
class SplashScreenPage extends HookConsumerWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //for testing
    // AutoRouter.of(context).push(Route());

    final authState = ref.watch(authStateProvider);
    final currentUser = ref.watch(authServiceProvider).currentUser;
    void performLoggingIn() async {
      bool isSuccess = false;
      await ref.read(authServiceProvider).refreshAuth();
      isSuccess = currentUser != null;
      if (isSuccess) {
        debugPrint('Auth is vaild for ${currentUser.email}');
        if (currentUser.email!.endsWith("@nyit.edu")) {
          debugPrint('Auth ends in @NYIT.edu :D\nGoing to Tab Navigation Page');
          // ignore: use_build_context_synchronously
          AutoRouter.of(context).replace(const TabControllerPage());
        } else {
          debugPrint('Error during auth for ${currentUser.email}');
          // ignore: use_build_context_synchronously
          AutoRouter.of(context).push(const ErrorPage());
        }
      } else {
        // debugPrint('Auth is broken, going back to LoginPage');
        // auth.signOut();
        debugPrint('Auth is unavailable, going to Login Page');
        // ignore: use_build_context_synchronously
        AutoRouter.of(context).replace(LoginPage());
      }
    }

    useEffect(
      () {
        if (currentUser != null) {
          performLoggingIn();
        } else {
          AutoRouter.of(context).replace(LoginPage());
        }
        return null;
      },
      [],
    );

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
