import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/modules/login/widgets/lottie_with_text_swipe.dart';
import 'package:idnyt/modules/shared/widgets/regular_button_widget.dart';
import 'package:idnyt/routing/router.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('IDNYT Logo Placeholder'),
              const Spacer(),
              LottieTextSwipe(),
              const Spacer(),
              RegularButtonWidget(
                text: "Get Started",
                onPressed: () {
                  AutoRouter.of(context).push(const SignInUpRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
