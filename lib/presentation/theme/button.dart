import 'package:flutter/material.dart';

TextButtonThemeData getButtonTheme(ColorScheme currentColorScheme) {
  return TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        Size.zero,
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(16),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStateProperty.all(
        currentColorScheme.tertiaryContainer,
      ),
      foregroundColor: MaterialStateProperty.all(
        currentColorScheme.onTertiaryContainer,
      ),
    ),
  );
}
