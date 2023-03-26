import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';

@RoutePage(name: "SplashScreenPage")
class SplashScreenPage extends HookConsumerWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //for testing
    // AutoRouter.of(context).push(Route());
    final authState = ref.watch(authStateProvider);

    if (authState.value != null) {
      if (ref
          .read(authServiceProvider)
          .currentUser!
          .email!
          .endsWith("@nyit.edu")) {
        AutoRouter.of(context).push(const HomePage());
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
