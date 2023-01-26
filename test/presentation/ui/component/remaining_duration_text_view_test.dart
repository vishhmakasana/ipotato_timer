import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/components/remaining_duration_text_view.dart';

main() {
  const int oneMinute = 60;
  const int oneHour = 3600;
  const int oneSecond = 1;

  testWidgets('Remaining text test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const RemainingDurationTextView(duration: oneSecond),
      ),
    );

    // for one second it should show 00:00:01
    final secondFinder = find.text('00:00:01');
    expect(secondFinder, findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const RemainingDurationTextView(duration: oneMinute),
      ),
    );

    // for one minute it should show 00:01:00
    final minuteFinder = find.text('00:01:00');
    expect(minuteFinder, findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const RemainingDurationTextView(duration: oneHour),
      ),
    );

    // for one minute it should show 01:00:00
    final hourFinder = find.text('01:00:00');
    expect(hourFinder, findsOneWidget);
  });
}
