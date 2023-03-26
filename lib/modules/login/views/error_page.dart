/*
If person that's logged in is not an @nyit.edu account
Show them and error screen and explain the issue
Of course sign them out and delete their account
Then go back to login screen
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'ErrorPage')
class ErrorPage extends HookConsumerWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Hey smth is wrong with your account!'),
              RegularButtonWidget(
                text: "Sign Out",
                onPressed: () => auth.signOut(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
