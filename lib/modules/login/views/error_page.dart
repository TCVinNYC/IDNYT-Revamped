import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'ErrorPage')
class ErrorPage extends HookConsumerWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authServiceProvider);
    auth.deleteUser();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You aren't an NYIT user.\n\nPlease sign in with an @NYIT email or contact your administrator!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RegularButtonWidget(
                  text: "Return to Login Page",
                  onPressed: () {
                    AutoRouter.of(context).pop(LoginPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
