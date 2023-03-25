import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/login/models/lottie_with_text_model.dart';

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

final lottiePositionProvider = StateProvider<int>((ref) {
  return 0;
});

final lottieSignUpListProvider = Provider<List>((ref) {
  return [
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
  ];
});
