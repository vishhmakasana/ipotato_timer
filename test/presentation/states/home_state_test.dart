import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';

import '../../core/di/mock_inject.dart';

main() {
  const title = 'Task #101';
  const description = 'Description of Task #101';
  const taskDurationInSeconds = 5;
  const Duration taskDuration = Duration(seconds: taskDurationInSeconds);

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    MockInject.init();
  });

  test('Expect all required dependencies injected', () {
    expect(
        GetIt.I
            .isRegistered<TaskDatabase>(),
        true);
    expect(GetIt.I.isRegistered<TaskRepository>(), true);
    expect(GetIt.I.isRegistered<AddTaskUseCase>(), true);
    expect(GetIt.I.isRegistered<GetAllTaskUseCase>(), true);
    expect(GetIt.I.isRegistered<GetTaskUseCase>(), true);
    expect(GetIt.I.isRegistered<DeleteTaskUseCase>(), true);
    expect(GetIt.I.isRegistered<PauseTaskUseCase>(), true);
    expect(GetIt.I.isRegistered<ResumeTaskUseCase>(), true);
    GetIt.I.reset();
  });

  test('Default values', () {
    final homeState = GetIt.I.get<HomeState>();
    expect(homeState.isLoading, false);
    expect(homeState.sortedTasks.isEmpty, true);
    GetIt.I.reset();
  });

  test('add / get task', () async {
    final homeState = GetIt.I.get<HomeState>();
    final taskId = await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    expect(taskId, isNotNull);
    final task = await homeState.getTask(taskId: taskId);
    expect(task, isNotNull);
    expect(task?.title, title);
    expect(task?.description, description);
    expect(task?.taskDuration, taskDuration);
    expect(task?.pausedTime, isNull);
    expect(task?.pausedDuration, Duration.zero);
    GetIt.I.reset();
  });

  test('pause task', () async {
    final homeState = GetIt.I.get<HomeState>();
    final taskId = await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    expect(taskId, isNotNull);
    var task = await homeState.getTask(taskId: taskId);
    expect(task?.isPaused, false);
    await homeState.pauseTask(taskId: taskId);
    task = await homeState.getTask(taskId: taskId);
    expect(task?.isPaused, true);
    GetIt.I.reset();
  });

  test('resume task', () async {
    final homeState = GetIt.I.get<HomeState>();
    final taskId = await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    expect(taskId, isNotNull);
    var task = await homeState.getTask(taskId: taskId);
    expect(task?.isPaused, false);
    await homeState.pauseTask(taskId: taskId);
    task = await homeState.getTask(taskId: taskId);
    expect(task?.isPaused, true);
    await homeState.resumeTask(
      taskId: taskId,
      pausedTime: task?.pausedTime,
      pausedDuration: task?.pausedDuration ?? Duration.zero,
    );
    task = await homeState.getTask(taskId: taskId);
    expect(task?.isPaused, false);
    GetIt.I.reset();
  });

  test('delete task', () async {
    final homeState = GetIt.I.get<HomeState>();
    final taskId = await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    expect(taskId, isNotNull);
    var result = await homeState.deleteTask(taskId: taskId);
    expect(result, true);
    final task = await homeState.getTask(taskId: taskId);
    expect(task, isNull);
    GetIt.I.reset();
  });

  test('get all tasks', () async {
    final homeState = GetIt.I.get<HomeState>();
    await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    await homeState.addTask(
        title: title, description: description, taskDuration: taskDuration);
    await homeState.initialize();
    expect(homeState.sortedTasks, isNotNull);
    expect(homeState.sortedTasks.length, 3);
    GetIt.I.reset();
  });

  tearDown(() async {
    await GetIt.I
        .get<TaskDatabase>()
        .close();
  });
}
