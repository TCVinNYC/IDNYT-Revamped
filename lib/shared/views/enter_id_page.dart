// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: "EnterIDPage")
class EnterIDPage extends HookConsumerWidget {
  UserModel userData;
  final TextEditingController _idNumberController = TextEditingController();
  EnterIDPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ID Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter your ID number to continue:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _idNumberController,
                decoration: const InputDecoration(
                  labelText: 'ID Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              RegularButtonWidget(
                onPressed: () async {
                  if (_idNumberController.text != '') {
                    try {
                      await ref
                          .read(firestoreProvider)
                          .firestore
                          .collection('users')
                          .doc(userData.email)
                          .update(
                        {'schoolID': _idNumberController.text},
                      );
                      debugPrint('Finished updating ID number');
                      // ignore: use_build_context_synchronously
                    } catch (e) {
                      debugPrint('Did not update ID number');
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please enter a valid ID Number'),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
