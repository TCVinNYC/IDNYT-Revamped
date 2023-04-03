import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: "TabControllerPage")
class TabControllerPage extends HookConsumerWidget {
  const TabControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestore = ref.read(firestoreProvider);
    final userData = ref.read(userDataProvider);

    void loadData() async {
      await ref.read(firestoreProvider).checkUserData();
      String? role = userData.value?.role;
      debugPrint(role);
      if (role == '') {
        firestore.createAccount();
      } else if (role == null) {}
    }

    useEffect(
      () {
        loadData();
        return null;
      },
      [],
    );
    return AutoTabsScaffold(
      routes: [
        if (userData.value?.role == 'student') const StudentHomePage(),
        if (userData.value?.role == 'professor') const ProfessorHomePage(),
        if (userData.value?.role == 'admin') const AdminHomePage(),
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
