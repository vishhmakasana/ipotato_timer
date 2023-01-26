import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ipotato_timer/main.dart' as app;
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/ui/components/task_list_item.dart';

void main() {
  const secondDuration = Duration(seconds: 1);
  const title = 'Task #101';
  const shortTitle = 'Ta';
  const description = 'Description of Task #101';
  const hour = '1';
  const minute = '1';
  const second = '1';
  const taskDuration = Duration(seconds: 10);

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('add task', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder addTaskButton = find.byKey(const ValueKey('btn_add_task'));

      // Verify the add task button presents
      expect(addTaskButton, findsOneWidget);

      // Emulate a tap on the floating action button.
      await tester.tap(addTaskButton);

      // Trigger a frame.
      await tester.pumpAndSettle(secondDuration);

      final Finder titleTextField =
          find.byKey(const ValueKey('text_field_title'));
      final Finder descTextField =
          find.byKey(const ValueKey('text_field_description'));
      final Finder hourTextField =
          find.byKey(const ValueKey('text_field_hour'));
      final Finder minuteTextField =
          find.byKey(const ValueKey('text_field_minute'));
      final Finder secondTextField =
          find.byKey(const ValueKey('text_field_second'));
      final Finder saveTaskButton = find.byKey(const ValueKey('btn_save_task'));

      // Verify the add task dialog has all fields
      expect(titleTextField, findsOneWidget);
      expect(descTextField, findsOneWidget);
      expect(hourTextField, findsOneWidget);
      expect(minuteTextField, findsOneWidget);
      expect(secondTextField, findsOneWidget);
      expect(saveTaskButton, findsOneWidget);

      // Emulate a tap on the save task button.
      await tester.tap(saveTaskButton);

      // Trigger a frame.
      await tester.pumpAndSettle(secondDuration);

      final Finder titleErrorText = find.text('Title cannot be blank');
      final Finder descriptionErrorText =
          find.text('Description cannot be blank');
      final Finder durationErrorText =
          find.text('Task duration cannot be zero');

      expect(titleErrorText, findsOneWidget);
      expect(descriptionErrorText, findsOneWidget);
      expect(durationErrorText, findsOneWidget);

      await Future.delayed(secondDuration);

      await tester.enterText(titleTextField, shortTitle);
      await tester.enterText(descTextField, description);
      await tester.enterText(hourTextField, hour);
      await tester.enterText(minuteTextField, minute);
      await tester.enterText(secondTextField, second);

      // Emulate a tap on the save task button.
      await tester.tap(saveTaskButton);

      // Trigger a frame.
      await tester.pumpAndSettle(secondDuration);

      expect(find.text('Title should be at least 3 characters long'),
          findsOneWidget);

      await tester.pumpAndSettle(secondDuration);

      await tester.tap(titleTextField);

      await tester.pumpAndSettle(secondDuration);

      // Enter the valid task title
      await tester.enterText(titleTextField, title);

      await tester.pumpAndSettle(secondDuration);

      // Emulate a tap on the save task button.
      await tester.tap(saveTaskButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      await Future.delayed(secondDuration);

      // added task should shown in list.

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(TaskListItem), findsOneWidget);

      expect(find.text(title), findsOneWidget);
      expect(find.text(description), findsOneWidget);
    });

    testWidgets('pause/resume task', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homeState = GetIt.I.get<HomeState>();

      final taskId = await homeState.addTask(
        title: title,
        description: description,
        taskDuration: taskDuration,
      );

      await tester.pumpAndSettle(secondDuration);

      // added task should shown in list.
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byKey(ValueKey('task_list_item_$taskId')),
          findsAtLeastNWidgets(1));

      expect(find.text(title), findsAtLeastNWidgets(1));
      expect(find.text(description), findsAtLeastNWidgets(1));

      await tester.pumpAndSettle(secondDuration);

      expect(find.byKey(const ValueKey('ic_pause')), findsAtLeastNWidgets(1));

      homeState.pauseTask(taskId: taskId);

      await tester.pumpAndSettle(secondDuration);

      expect(find.byKey(const ValueKey('ic_play')), findsAtLeastNWidgets(1));

      await tester.pumpAndSettle(secondDuration);

      final task = await homeState.getTask(taskId: taskId);

      homeState.resumeTask(
        taskId: taskId,
        pausedDuration: task!.pausedDuration,
        pausedTime: task.pausedTime,
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('ic_pause')), findsAtLeastNWidgets(1));

      await tester.pumpAndSettle(secondDuration);
    });

    testWidgets('delete task', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homeState = GetIt.I.get<HomeState>();

      final taskId = await homeState.addTask(
        title: title,
        description: description,
        taskDuration: taskDuration,
      );

      await tester.pumpAndSettle(secondDuration);

      // added task should shown in list.
      expect(find.byKey(ValueKey('task_list_item_$taskId')),
          findsAtLeastNWidgets(1));

      expect(find.text(title), findsAtLeastNWidgets(1));
      expect(find.text(description), findsAtLeastNWidgets(1));

      await tester.pumpAndSettle(secondDuration);

      expect(find.byKey(const ValueKey('ic_stop')), findsAtLeastNWidgets(1));

      homeState.deleteTask(taskId: taskId);

      await tester.pumpAndSettle(secondDuration);

      // no task should shown in list.
      expect(find.byKey(ValueKey('task_list_item_$taskId')), findsNothing);

      await tester.pumpAndSettle(secondDuration);
    });

    tearDown(() {
      GetIt.I.reset();
    });
  });
}
