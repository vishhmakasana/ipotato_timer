import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/data/repositories/local_task_repository_impl.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

void main() {
  late TaskRepository repository;
  late TaskDatabase database;

  const title = 'Task #101';
  const description = 'Description of Task #101';
  const taskDurationInSeconds = 5;
  const Duration taskDuration = Duration(seconds: taskDurationInSeconds);
  final DateTime creationTime = DateTime.now();
  const fooId = 102;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    database = TaskDatabase.forTesting(NativeDatabase.memory());
    repository = LocalTaskRepositoryImpl(database);
  });

  test('Adding task', () async {
    final taskId = await repository.addTask(TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    ));
    expect(taskId > 0, true);
    final task = await repository.getTask(taskId);
    expect(task != null, true);
  });

  test('Getting task', () async {
    final taskId = await repository.addTask(TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    ));
    expect(taskId > 0, true);
    final task = await repository.getTask(taskId);
    expect(task != null, true);
    expect(task?.title, title);
    expect(task?.description, description);
    expect(task?.taskDuration, taskDuration);
    expect(task?.pausedTime, null);
    expect(task?.pausedDuration, Duration.zero);

    await repository.addTask(TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    ));

    final tasksList = await repository.getAllTask();
    expect(tasksList.length, 2);
  });

  test('Deleting task', () async {
    final taskId = await repository.addTask(TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    ));
    expect(taskId > 0, true);
    var tasksList = await repository.getAllTask();
    expect(tasksList.length, 1);

    var result = await repository.deleteTask(taskId);
    expect(result, true);

    result = await repository.deleteTask(fooId);
    expect(result, false);

    tasksList = await repository.getAllTask();
    expect(tasksList.length, 0);
  });

  test('Pausing/Resuming task', () async {
    final taskId = await repository.addTask(TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    ));
    expect(taskId > 0, true);

    var result = await repository.pauseTask(
        creationTime.add(const Duration(seconds: 2)), taskId);
    expect(result, true);

    var task = await repository.getTask(taskId);
    expect(task?.isPaused, true);
    expect(task?.remainingDuration,
        const Duration(seconds: taskDurationInSeconds - 2));
    expect(task?.elapsedDuration, const Duration(seconds: 2));

    result = await repository.resumeTask(
        creationTime.add(const Duration(seconds: 2)),
        creationTime.add(const Duration(seconds: 5)),
        taskId);
    expect(result, true);
    task = await repository.getTask(taskId);
    expect(task?.isPaused, false);
  });

  tearDown(() async {
    await database.close();
  });
}
