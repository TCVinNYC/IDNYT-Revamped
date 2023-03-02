import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextFieldWidget extends ConsumerWidget {
  const TextFieldWidget({
    Key? key,
    required this.keyboardType,
    required this.borderType,
    required this.iconData,
    required this.labelText,
    required this.iconSize,
    this.inputFormat,
  }) : super(key: key);

  final TextInputType keyboardType;
  final InputBorder borderType;
  final IconData iconData;
  final String labelText;
  final double iconSize;
  final List<TextInputFormatter>? inputFormat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
      child: TextFormField(
        autofocus: true,
        enableSuggestions: true,
        maxLines: 1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        keyboardType: keyboardType,
        inputFormatters: inputFormat,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 18),
          border: borderType,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
            child: Icon(
              iconData,
              size: iconSize,
            ),
          ),
          labelStyle: const TextStyle(fontSize: 18),
          labelText: labelText,
        ),
      ),
    );
  }
}
