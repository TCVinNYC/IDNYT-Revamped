import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: "TabControllerPage")
class TabControllerPage extends HookConsumerWidget {
  const TabControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(firestoreProvider).userData;

    return AutoTabsScaffold(
      routes: [
        const IDCardPage(),
        // StudentHomePage(userData: firestore.userData),
        if (userData.role == 'student') StudentHomePage(userData: userData),
        if (userData.role == 'professor') ProfessorHomePage(userData: userData),
        if (userData.role == 'admin') AdminHomePage(userData: userData),
        const ProfilePage(),
      ],
      animationDuration: const Duration(seconds: 0),
      lazyLoad: true,
      homeIndex: 0,
      primary: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'ID Card',
              icon: Icon(Icons.credit_card_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Courses',
              icon: Icon(Icons.my_library_books_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_2_rounded),
            ),
          ],
        );
      },
    );
  }
}
