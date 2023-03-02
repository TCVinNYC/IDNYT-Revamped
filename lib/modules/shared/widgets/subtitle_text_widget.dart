import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubtitleTextWidget extends ConsumerWidget {
  const SubtitleTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 50, 4),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 17, color: Colors.grey[600]),
      ),
    );
  }
}
