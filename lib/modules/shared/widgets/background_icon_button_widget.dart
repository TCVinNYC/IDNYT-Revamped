import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BackgroundIconButton extends ConsumerWidget {
  const BackgroundIconButton(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.backgroundColor})
      : super(key: key);

  final Icon icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: IconButton(
        icon: icon,
        onPressed: () {},
        color: iconColor,
      ),
    );
  }
}
