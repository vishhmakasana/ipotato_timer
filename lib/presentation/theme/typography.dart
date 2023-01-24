import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme getTextTheme(ColorScheme currentColorScheme) {
  return TextTheme(
    displayLarge: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 57,
      height: 64 / 57,
      letterSpacing: -0.25,
    ),
    displayMedium: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 45,
      height: 52 / 45,
    ),
    displaySmall: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 44 / 36,
    ),
    headlineLarge: GoogleFonts.roboto(
      color: currentColorScheme.primary,
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 40 / 32,
    ),
    headlineMedium: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 28,
      height: 36 / 28,
    ),
    headlineSmall: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 32 / 24,
    ),
    titleLarge: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 28 / 22,
    ),
    titleMedium: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.1,
    ),
    titleSmall: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
    ),
    labelLarge: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 20 / 14,
    ),
    labelMedium: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w700,
      fontSize: 12,
      height: 16 / 12,
    ),
    labelSmall: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w700,
      fontSize: 11,
      height: 16 / 11,
    ),
    bodyLarge: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 24 / 16,
    ),
    bodyMedium: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
    ),
    bodySmall: GoogleFonts.roboto(
      color: currentColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 16 / 12,
    ),
  );
}
