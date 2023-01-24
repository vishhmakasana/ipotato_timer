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

InputDecoration getInputBorderDuration(BuildContext context) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: '00',
    counterText: "",
    filled: true,
    hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.secondary.withAlpha(70),
        ),
    fillColor: Theme.of(context).colorScheme.secondaryContainer,
  );
}

TextStyle getErrorTextStyle({required BuildContext context, Color? color}) {
  return Theme.of(context).textTheme.labelSmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.error,
      );
}
