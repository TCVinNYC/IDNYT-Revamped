import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/modules/shared/widgets/regular_button_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Importing provider
import 'package:idnyt/modules/shared/providers/user_provider.dart';

import '../../shared/models/user.dart';

/**
 * Page for the sign in / sign up
 */

class SignInUpPage extends HookConsumerWidget {
  const SignInUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final user = ref.watch(userProvider);

    /*
    Todo 1: Implement Google SSO login
  */

    Future<void> _handleSignIn() async {
      try {
        // await signin
        bool loginSuccess = true;
        if (loginSuccess) {
          // Login Successful
          // Set user info and push the main page

          final currentUser = User(
            id: 1,
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            isLoggedIn: true,
          );
          ref.read(userProvider).loginUser(currentUser);
        }
      } catch (error) {
        // Handle SignIn Error
        // Do stuff
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In / Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Sign in logic here
              },
              child: const Text('Sign In / up with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

// class SignInUpPage extends StatefulWidget {
//   const SignInUpPage({Key? key}) : super(key: key);

//   @override
//   _SignInUpPageState createState() => _SignInUpPageState();
// }

// /**
//  * SignInData
//  */
// class SignInData {
//   String? email = '';
//   String password = '';
// }

// class _SignInUpPageState extends State<SignInUpPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign In / Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Sign in logic here
//               },
//               child: const Text('Sign In / up with Google'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
