import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RoundedButtonWidget extends ConsumerWidget {
  const RoundedButtonWidget({
    Key? key,
    required this.text,
    required this.elevation,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final double elevation;
  final double fontSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey,
          elevation: elevation,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, color: const Color.fromARGB(255, 50, 50, 50)),
        ));
  }
}
