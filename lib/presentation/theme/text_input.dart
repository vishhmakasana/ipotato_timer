import 'package:flutter/material.dart';

final inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1,
  ),
  borderRadius: BorderRadius.circular(8.0),
);

TextStyle getHintTextStyle({required BuildContext context, Color? color}) {
  return Theme.of(context).textTheme.bodyText1!.copyWith(
        color: color ?? Theme.of(context).colorScheme.outline,
      );
}
