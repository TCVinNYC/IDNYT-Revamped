import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.dart';

@RoutePage(name: "TabControllerPage")
class TabControllerPage extends HookConsumerWidget {
  UserModel userData;
  TabControllerPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: [
        StudentHomePage(
            userData:
                userData), // we know that this gets loaded first before loadData gets to finish
        // if (userDataStream.value?.role == 'student')
        //   StudentHomePage(currentUser: userDataStream.value),
        // if (userDataStream.value?.role == 'professor')
        //   const ProfessorHomePage(),
        // if (userDataStream.value?.role == 'admin') const AdminHomePage(),
        const RedPage(),
        const GreenPage(),
        const BluePage(),
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
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Red',
              icon: Icon(Icons.reddit),
            ),
            BottomNavigationBarItem(
              label: 'Green',
              icon: Icon(Icons.grade),
            ),
            BottomNavigationBarItem(
              label: 'Blue',
              icon: Icon(Icons.blender),
            ),
          ],
        );
      },
    );
  }
}
