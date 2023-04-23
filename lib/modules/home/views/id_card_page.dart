// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:idnyt_revamped/modules/home/providers/semester.provider.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';

@RoutePage(name: 'IDCardPage')
class IDCardPage extends HookConsumerWidget {
  UserModel userData;
  IDCardPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSemester = ref.read(currentSemesterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF233972),
        title: const Text(
          'My NYIT ID',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            enableFeedback: true,
            onSelected: (value) {
              if (value == 'help') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    dismissDirection: DismissDirection.down,
                    elevation: 3,
                    showCloseIcon: true,
                    closeIconColor: Colors.redAccent,
                    content: Text('Contact NYIT Admin!'),
                  ),
                );
              }
              if (value == 'logout') {
                ref.read(authServiceProvider).signOut();
                AutoRouter.of(context).replace(LoginPage());
              }
            },
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  value: 'help',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.help_rounded,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.logout,
                          color: Colors.redAccent,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF233972),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userData.profilePicture),
                    radius: 64,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    userData.fullName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    userData.role.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Divider(height: 0),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'NYIT Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        userData.email,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Divider(height: 0),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ID Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        userData.schoolID,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Divider(height: 0),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Credit Balance',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Unavailable",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Divider(height: 0),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Current Semester',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        currentSemester,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: userData.schoolID,
                    width: 350,
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
