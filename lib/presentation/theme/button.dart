import 'package:flutter/material.dart';

TextButtonThemeData getButtonTheme(ColorScheme currentColorScheme) {
  return TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        currentColorScheme.tertiaryContainer,
      ),
      foregroundColor: MaterialStateProperty.all(
        currentColorScheme.onTertiaryContainer,
      ),
    ),
  );
}