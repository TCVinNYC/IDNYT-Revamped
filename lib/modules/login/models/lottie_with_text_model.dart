import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LottieTextModel extends ConsumerWidget {
  const LottieTextModel({
    Key? key,
    required this.lottieLocation,
    required this.titleText,
    required this.subtitleText,
  }) : super(key: key);

  final String lottieLocation;
  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          lottieLocation,
          width: MediaQuery.of(context).size.width / 1.35,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: Text(
            titleText,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
          child: Text(
            subtitleText,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
