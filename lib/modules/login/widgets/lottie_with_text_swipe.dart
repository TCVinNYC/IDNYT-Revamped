import 'package:idnyt/modules/login/providers/lottie_provider.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LottieTextSwipe extends ConsumerWidget {
  LottieTextSwipe({
    Key? key,
  }) : super(key: key);

  final _pageController = PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieSignUpList = ref.read(lottieSignUpListProvider);
    final lottiePosition = ref.watch(lottiePositionProvider);

    return SizedBox(
      height: 525,
      child: Column(
        children: [
          SizedBox(
            height: 425,
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
          PageViewIndicator(
            length: lottieSignUpList.length,
            currentIndex: lottiePosition,
            margin: const EdgeInsets.all(5),
            borderRadius: 10,
            animationDuration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}
