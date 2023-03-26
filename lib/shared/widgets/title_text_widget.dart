import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleTextWidget extends ConsumerWidget {
  const TitleTextWidget({
    Key? key,
    required this.text,
    this.width,
  }) : super(key: key);

  final String text;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      width: width,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 35),
        softWrap: true,
      ),
    );
  }
}
