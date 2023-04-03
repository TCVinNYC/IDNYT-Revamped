import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: 'AdminHomePage')
class AdminHomePage extends HookConsumerWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final currentUser = ref.watch(userDataProvider);
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
              const Text('Hey Admin you signed in!'),
              Text(currentUser.value?.email ?? "No email"),
              Text(currentUser.value?.fullName ?? "No name"),
              Text(currentUser.value?.role ?? "No role"),
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
