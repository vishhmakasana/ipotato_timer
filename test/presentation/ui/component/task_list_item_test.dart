import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/components/task_list_item.dart';
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

  final finishedTask = Task(
    id: 101,
    title: 'Task #101',
    description: 'Description of Task #101',
    creationTime: DateTime.now(),
    isFinished: true,
    pausedTime: DateTime.now(),
    pausedDuration: 0,
    taskDuration: 10,
  );

  setUpAll(() {
    MockInject.init();
  });

  testWidgets('Running task test', (tester) async {
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
            child: TaskListItem(listItem: runningTask),
          ),
        ),
      ),
    );

    //if task is running it List item should show pause button
    final pauseButtonFinder = find.byKey(const ValueKey('ic_pause'));
    expect(pauseButtonFinder, findsOneWidget);

    //if task is running it should show stop button
    var stopButtonFinder = find.byKey(const ValueKey('ic_stop'));
    expect(stopButtonFinder, findsOneWidget);

    //if task is running it should show stop button
    var finishedTextFinder = find.text('FINISHED');
    expect(finishedTextFinder, findsNothing);
  });

  testWidgets("Paused task test", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: Provider<HomeState>(
          create: (_) {
            return HomeState();
          },
          child: Material(
            child: TaskListItem(listItem: pausedTask),
          ),
        ),
      ),
    );

    //if task is paused list item should show play button
    final playButtonFinder = find.byKey(const ValueKey('ic_play'));
    expect(playButtonFinder, findsOneWidget);

    //if task is running it should show stop button
    final stopButtonFinder = find.byKey(const ValueKey('ic_stop'));
    expect(stopButtonFinder, findsOneWidget);

    //if task is running it should show stop button
    final finishedTextFinder = find.text('FINISHED');
    expect(finishedTextFinder, findsNothing);
  });

  testWidgets("Finished task test", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: Provider<HomeState>(
          create: (_) {
            return HomeState();
          },
          child: Material(
            child: TaskListItem(listItem: finishedTask),
          ),
        ),
      ),
    );

    //if task is finished list item should not have play button
    final playButtonFinder = find.byKey(const ValueKey('ic_play'));
    expect(playButtonFinder, findsNothing);

    //if task is finished list item should not have pause button
    final pauseButtonFinder = find.byKey(const ValueKey('ic_pause'));
    expect(pauseButtonFinder, findsNothing);

    //if task is finished list item should not have stop button
    final stopButtonFinder = find.byKey(const ValueKey('ic_stop'));
    expect(stopButtonFinder, findsNothing);

    //if task is running it should show stop button
    final finishedTextFinder = find.text('FINISHED');
    expect(finishedTextFinder, findsOneWidget);

    //if task is running it should show stop button
    final markCompleteTextFinder = find.text('MARK COMPLETE');
    expect(markCompleteTextFinder, findsOneWidget);
  });
}
