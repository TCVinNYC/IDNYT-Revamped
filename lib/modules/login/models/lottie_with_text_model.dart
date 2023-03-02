import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LottieTextModel extends ConsumerWidget {
  const LottieTextModel({
    Key? key,
    required this.lottieLocation,
    required this.titleText,
  }) : super(key: key);

  final String lottieLocation;
  final String titleText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(
          lottieLocation,
          width: MediaQuery.of(context).size.width / 1.35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            titleText,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
