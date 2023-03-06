import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt/modules/login/providers/lottie_provider.dart';
import 'package:idnyt/modules/shared/widgets/regular_button_widget.dart';
import 'package:idnyt/routing/router.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _pageController = PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieSignUpList = ref.read(lottieSignUpListProvider);
    final lottiePosition = ref.watch(lottiePositionProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text(
                'IDNYT Logo Placeholder',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: lottieTitleList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                pageSnapping: true,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return lottieSignUpList[index];
                },
                onPageChanged: (value) {
                  ref.read(lottiePositionProvider.notifier).state = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: PageViewIndicator(
                length: lottieSignUpList.length,
                currentIndex: lottiePosition,
                margin: const EdgeInsets.all(5),
                borderRadius: 10,
                animationDuration: const Duration(milliseconds: 250),
              ),
            ),
            RegularButtonWidget(
              text: "Get Started",
              onPressed: () {
                AutoRouter.of(context).push(const HomeRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
