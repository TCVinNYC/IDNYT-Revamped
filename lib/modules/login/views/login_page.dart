import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:idnyt_revamped/modules/login/models/lottie_with_text_model.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: "LoginPage")
class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _pageController = PageController(viewportFraction: 1, initialPage: 0);

  final lottieImageList = [
    'assets/lottie/girl-studying-on-laptop.json',
    'assets/lottie/calendar.json',
    'assets/lottie/tap-nfc-apple.json',
  ];

  final lottieTitleList = [
    'lottie_title_one'.tr(),
    'lottie_title_two'.tr(),
    'lottie_title_three'.tr(),
  ];

  final lottieSubtitleList = [
    'lottie_subtitle_one'.tr(),
    'lottie_subtitle_two'.tr(),
    'lottie_subtitle_three'.tr(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                child: const Image(
                  image: AssetImage('assets/images/IDNYTColor.png'),
                ),
              ),
              Flexible(
                child: PageView(
                  controller: _pageController,
                  children: [
                    LottieTextModel(
                      lottieLocation: lottieImageList[0],
                      titleText: lottieTitleList[0],
                      subtitleText: lottieSubtitleList[0],
                    ),
                    LottieTextModel(
                      lottieLocation: lottieImageList[1],
                      titleText: lottieTitleList[1],
                      subtitleText: lottieSubtitleList[1],
                    ),
                    LottieTextModel(
                      lottieLocation: lottieImageList[2],
                      titleText: lottieTitleList[2],
                      subtitleText: lottieSubtitleList[2],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: lottieImageList.length,
                  effect: const ExpandingDotsEffect(),
                ),
              ),
              RegularButtonWidget(
                text: "Get Started",
                onPressed: () async {
                  await auth.signInWithGoogle();
                  if (auth.currentUser != null) {
                    debugPrint('Auth is vaild for ${auth.currentUser?.email}');
                    if (auth.currentUser!.email!.endsWith("@nyit.edu")) {
                      debugPrint(
                          'Auth ends in @NYIT.edu :D\nGoing to Tab Navigation Page');
                      await ref.read(firestoreProvider).checkUserData();
                      // ignore: use_build_context_synchronously
                      AutoRouter.of(context).replace(const TabControllerPage());
                    } else {
                      debugPrint(
                          'Error during auth for ${auth.currentUser!.email}');
                      // ignore: use_build_context_synchronously
                      AutoRouter.of(context).push(const ErrorPage());
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
