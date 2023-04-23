import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: "TabControllerPage")
class TabControllerPage extends HookConsumerWidget {
  const TabControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataStream = ref.watch(userDataStreamProvider);
    if (userDataStream.value == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final UserModel userData = userDataStream.value as UserModel;
    return AutoTabsScaffold(
      routes: [
        if (userData.schoolID == '')
          EnterIDPage(userData: userData)
        else
          IDCardPage(userData: userData),
        if (userData.role == 'student') const StudentHomePage(),
        if (userData.role == 'professor') ProfessorHomePage(userData: userData),
        if (userData.role == 'admin') AdminHomePage(userData: userData),
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
              label: 'ID',
              icon: Icon(Icons.credit_card_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Courses',
              icon: Icon(Icons.my_library_books_rounded),
            ),
          ],
        );
      },
    );
  }
}
