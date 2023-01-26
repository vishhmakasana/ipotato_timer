import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/components/play_pause_button.dart';
import 'package:provider/provider.dart';

import '../../../core/di/mock_inject.dart';

main() {
  final runningTask = Task(
    id: 101,
    title: 'Task #101',
    description: 'Description of Task #101',
    creationTime: DateTime.now(),
    isFinished: false,
    pausedTime: null,
    pausedDuration: 0,
    taskDuration: 10,
  );

  final pausedTask = Task(
    id: 101,
    title: 'Task #101',
    description: 'Description of Task #101',
    creationTime: DateTime.now(),
    isFinished: false,
    pausedTime: DateTime.now(),
    pausedDuration: 0,
    taskDuration: 10,
  );

  setUpAll(() {
    MockInject.init();
  });

  testWidgets('Play button test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: Provider<HomeState>(
          create: (_) {
            return HomeState();
          },
          child: Material(
            child: PlayPauseButton(listItem: runningTask),
          ),
        ),
      ),
    );

    //if task is running it should show pause button
    final pauseButtonFinder = find.byKey(const ValueKey('ic_pause'));
    expect(pauseButtonFinder, findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: Provider<HomeState>(
          create: (_) {
            return HomeState();
          },
          child: Material(
            child: PlayPauseButton(listItem: pausedTask),
          ),
        ),
      ),
    );

    //if task is paused it should show play button
    final playButtonFInder = find.byKey(const ValueKey('ic_play'));
    expect(playButtonFInder, findsOneWidget);
  });
}
