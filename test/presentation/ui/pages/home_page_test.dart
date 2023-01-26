import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/theme/app_theme.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_suggestion_view.dart';
import 'package:ipotato_timer/presentation/ui/pages/home_page.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/mock_callable.dart';
import '../../../core/di/mock_inject.dart';

main() {
  const taskId = 101;
  const title = 'Task #101';
  const description = 'Description of Task #101';
  const taskDurationInSeconds = 5;
  final DateTime creationTime = DateTime.now();

  setUpAll(() {
    MockInject.init();
  });

  testWidgets('Empty list home test', (tester) async {
    HomeState homeState = HomeState();
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: HomePage(
          homeState: homeState,
        ),
      ),
    );

    //home screen should have add task button
    final addTaskButtonFinder = find.byKey(const ValueKey('btn_add_task'));
    expect(addTaskButtonFinder, findsOneWidget);

    //initially it should show add task suggestion
    final addTaskSuggestionFinder = find.byType(AddTaskSuggestionView);
    expect(addTaskSuggestionFinder, findsOneWidget);

    //initially it should not have any list view
    final listViewFinder = find.byType(ListView);
    expect(listViewFinder, findsNothing);
  });

  testWidgets('With some data home test', (tester) async {
    HomeState homeState = HomeState();

    final statusChanged = MockCallable<bool>();
    final isNoTasksFoundChanged = MockCallable<bool>();

    reaction<bool>(
        (_) => homeState.isLoading, (newValue) => statusChanged(newValue));

    reaction<bool>((_) => homeState.isNoTasksFound, (newValue) {
      debugPrint('isNoTasksFound : changed $newValue');
      return isNoTasksFoundChanged(newValue);
    });

    // add one entry to the database
    final database =
        GetIt.I.get<TaskDatabase>(instanceName: testDatabaseInstanceName);
    await database.into(database.tasks).insert(
          TasksCompanion.insert(
            id: const Value(taskId),
            title: title,
            description: description,
            creationTime: creationTime,
            taskDuration: taskDurationInSeconds,
          ),
        );

    // list length should be 0
    expect(homeState.sortedTasks.length, 0);
    expect(homeState.isNoTasksFound, true);

    // initially loading false
    expect(homeState.isLoading, false);

    await tester.pumpWidget(
      MaterialApp(
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: HomePage(
          homeState: homeState,
        ),
      ),
    );

    verifyInOrder([
      isNoTasksFoundChanged(false),
    ]);

    // list length should be 1
    expect(homeState.sortedTasks.length, 1);
    expect(homeState.isNoTasksFound, false);

    await tester.pump();

    //home screen should have add task button
    final addTaskButtonFinder = find.byKey(const ValueKey('btn_add_task'));
    expect(addTaskButtonFinder, findsOneWidget);
  });
}
