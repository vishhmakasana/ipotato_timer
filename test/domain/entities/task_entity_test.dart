import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late TaskEntity task;

  const title = 'Task #101';
  const description = 'Description of Task #101';
  const taskDurationInSeconds = 5;
  final DateTime creationTime = DateTime.now();
  const Duration taskDuration = Duration(seconds: taskDurationInSeconds);

  setUp(() {
    task = TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    );
  });

  test('Task should exist', () {
    expect(task, isNotNull);
  });

  test('Required values should be not null ', () {
    expect(task.title, isNotNull);
    expect(task.description, isNotNull);
    expect(task.creationTime, isNotNull);
    expect(task.taskDuration, isNotNull);
  });

  test('TaskEntity constructor sets required properties', () {
    expect(task.title, title);
    expect(task.description, description);
    expect(task.creationTime, creationTime);
    expect(task.taskDuration, taskDuration);
  });

  test('Task duration should be greater then Duration.zero', () {
    expect(task.taskDuration.inMilliseconds > 0, true);
  });

  test('Default paused duration should be Duration.zero', () {
    expect(task.pausedDuration, Duration.zero);
  });

  test('Default paused time should be null', () {
    expect(task.pausedTime, isNull);
  });

  test('elapsedDuration getter returns correct value', () {
    // simulate task being paused
    task.pausedTime = creationTime.add(const Duration(seconds: 2));
    // elapsed duration should be 2 seconds
    expect(task.elapsedDuration, const Duration(seconds: 2));
  });

  test('remainingDuration getter returns correct value', () {
    // simulate task being paused
    task.pausedTime = creationTime.add(const Duration(seconds: 2));
    // elapsed duration should be 3 seconds
    expect(task.remainingDuration, const Duration(seconds: 3));
  });

  test('Is task finished scenarios', () async {
    expect(task.isFinished, false);
    await Future.delayed(const Duration(seconds: taskDurationInSeconds - 1));
    expect(task.isFinished, false);
    await Future.delayed(const Duration(seconds: 1));
    expect(task.isFinished, true);
  });

  test('Task pause/resume scenarios', () async {
    expect(task.pausedDuration, Duration.zero);
    const Duration twoSecondDuration = Duration(seconds: 2);

    // task is running for 2 seconds
    await Future.delayed(twoSecondDuration);
    expect(task.isPaused, false);

    // pause the task
    task.pausedTime = creationTime.add(twoSecondDuration);
    expect(task.isPaused, true);

    // elapsed duration should be 2
    expect(task.elapsedDuration, twoSecondDuration);
    // remaining duration should be 3
    expect(task.remainingDuration, taskDuration - twoSecondDuration);

    // lets wait for remaining time and check the status
    await Future.delayed(taskDuration - twoSecondDuration);
    expect(task.isFinished, false);

    // resume the task
    task.pausedDuration =
        DateTime.now().difference(task.pausedTime ?? DateTime.now());
    task.pausedTime = null;

    // task should be running
    expect(task.isPaused, false);

    // lets wait for remaining time and check the status
    await Future.delayed(taskDuration - twoSecondDuration);
    expect(task.isFinished, true);
  });
}
