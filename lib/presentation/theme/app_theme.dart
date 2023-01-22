import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/theme/button.dart';
import 'package:ipotato_timer/presentation/theme/typography.dart';

import 'color_schemes.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: defaultLightColorScheme,
  textTheme: getTextTheme(defaultLightColorScheme),
  textButtonTheme: getButtonTheme(defaultLightColorScheme),
  appBarTheme: AppBarTheme(
    color: defaultLightColorScheme.secondary,
    foregroundColor: defaultLightColorScheme.onSecondary,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: defaultDarkColorScheme,
  textTheme: getTextTheme(defaultDarkColorScheme),
  textButtonTheme: getButtonTheme(defaultDarkColorScheme),
  appBarTheme: AppBarTheme(
    color: defaultDarkColorScheme.secondary,
    foregroundColor: defaultDarkColorScheme.onSecondary,
  ),
);
