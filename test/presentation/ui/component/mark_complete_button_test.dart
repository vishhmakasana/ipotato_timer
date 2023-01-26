import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/components/mark_complete_button.dart';
import 'package:provider/provider.dart';

import '../../../core/di/mock_inject.dart';

main() {
  setUpAll(() {
    MockInject.init();
  });

  testWidgets('Mark complete has a text MARK COMPLETE', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iPotato Timer',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: Provider<HomeState>(
          create: (_) {
            return HomeState();
          },
          child: const MarkCompleteButton(taskId: 0),
        ),
      ),
    );

    final markTextFinder = find.byKey(const ValueKey('btn_mark_complete'));
    expect(markTextFinder, findsOneWidget);

    final completeTextFinder = find.text('MARK COMPLETE');
    expect(completeTextFinder, findsOneWidget);
  });
}
