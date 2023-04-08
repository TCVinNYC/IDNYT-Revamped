// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'ProfessorHomePage')
class ProfessorHomePage extends HookConsumerWidget {
  UserModel userData;
  ProfessorHomePage({Key? key, required this.userData}) : super(key: key);

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
              const Text('Hey Professor you signed in!'),
              Text(userData.email),
              Text(userData.fullName),
              Text(userData.role),
              RegularButtonWidget(
                  text: "Sign Out",
                  onPressed: () {
                    auth.signOut();
                    AutoRouter.of(context).replace(LoginPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
