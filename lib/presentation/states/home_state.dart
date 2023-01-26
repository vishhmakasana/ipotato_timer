import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/audio/audio_service.dart';
import 'package:ipotato_timer/core/database/database.dart' as db;
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/mapper/task_state_mapper.dart';
import 'package:ipotato_timer/domain/usecases/play_sound_usecase.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

// ignore: library_private_types_in_public_api
class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  final _getAllTasksUseCase = GetIt.I.get<GetAllTaskUseCase>();
  final _addTaskUseCase = GetIt.I.get<AddTaskUseCase>();
  final _getTasksUseCase = GetIt.I.get<GetTaskUseCase>();
  final _pauseTaskUseCase = GetIt.I.get<PauseTaskUseCase>();
  final _resumeTaskUseCase = GetIt.I.get<ResumeTaskUseCase>();
  final _deleteTaskUseCase = GetIt.I.get<DeleteTaskUseCase>();
  final _playSoundUseCase = GetIt.I.get<PlaySoundUseCase>();

  // TODO : use this to show errors snack bar remote repository
  @observable
  String? errorMessage;

  // TODO : use this to show loading dialog for remote repository
  @observable
  bool showLoadingDialog = false;

  @observable
  int timeElapsed = 0;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Task> _tasks = ObservableList.of([]);

  @computed
  ObservableList<Task> get sortedTasks {
    return ObservableList.of(_tasks.sorted());
  }

  @computed
  int get activeTaskCount {
    return _tasks.where((element) => !element.isFinished).length;
  }

  @computed
  bool get isNoTasksFound => _tasks.isEmpty;

  @readonly
  Timer? _mTimer;

  @action
  Future<void> initialize() async {
    isLoading = true;
    await _loadAllTasks();
    isLoading = false;
    startTimer();
  }

  @action
  startTimer() {
    if (_mTimer != null && _mTimer!.isActive) return;
    _mTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_tasks.isEmpty || activeTaskCount == 0) return;
        timeElapsed++;
        updateFinishedStatus();
      },
    );
  }

  @action
  Future<bool> _loadAllTasks() async {
    final tasks = await _getAllTasksUseCase.getAllTask();
    _tasks = ObservableList.of(tasks);
    return true;
  }

  @action
  Future<TaskId> addTask({
    required String title,
    required String description,
    required Duration taskDuration,
  }) async {
    showLoadingDialog = true;

    final creationTime = DateTime.now();

    TaskEntity task = TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    );

    final result = await _addTaskUseCase.addTask(task);
    showLoadingDialog = false;
    if (result.isSuccess()) {
      final taskId = result.tryGetSuccess();
      task.id = taskId;
      _tasks.add(task.toTaskState);
      return taskId;
    } else {
      final error = result.tryGetError();
      errorMessage = error.toString();
      return null;
    }
  }

  @action
  Future<bool> pauseTask({
    required TaskId taskId,
  }) async {
    showLoadingDialog = true;
    final pauseTime = DateTime.now();
    final result = await _pauseTaskUseCase.pauseTask(pauseTime, taskId);
    if (result.isSuccess()) {
      final result = await _getTasksUseCase.getTask(taskId);
      showLoadingDialog = false;
      result.whenSuccess((task) {
        updateInMemoryTask(task);
      });
      return true;
    } else {
      showLoadingDialog = false;
      final error = result.tryGetError();
      errorMessage = error.toString();
      return false;
    }
  }

  @action
  Future<bool> resumeTask({
    required TaskId taskId,
    required DateTime? pausedTime,
    required Duration pausedDuration,
  }) async {
    if (pausedTime == null) return Future.value(false);
    final resumeTime = DateTime.now();
    showLoadingDialog = true;
    final result = await _resumeTaskUseCase.resumeTask(
      pausedDuration: pausedDuration,
      pausedTime: pausedTime,
      taskId: taskId,
      resumeTime: resumeTime,
    );
    if (result.isSuccess()) {
      final result = await _getTasksUseCase.getTask(taskId);
      result.whenSuccess((task) {
        showLoadingDialog = false;
        updateInMemoryTask(task);
      });
      return true;
    } else {
      showLoadingDialog = false;
      final error = result.tryGetError();
      errorMessage = error.toString();
      return false;
    }
  }

  @action
  Future<bool> deleteTask({
    required TaskId taskId,
  }) async {
    showLoadingDialog = true;
    final result = await _deleteTaskUseCase.deleteTask(
      taskId,
    );
    showLoadingDialog = false;
    if (result.isSuccess()) {
      _tasks.removeWhere((element) => element.id == taskId);
      return true;
    } else {
      final error = result.tryGetError();
      errorMessage = error.toString();
      return false;
    }
  }

  @action
  Future<TaskEntity?> getTask({
    required TaskId taskId,
  }) async {
    final result = await _getTasksUseCase.getTask(
      taskId,
    );
    if (result.isSuccess()) {
      final task = result.tryGetSuccess();
      return task;
    } else {
      final error = result.tryGetError();
      errorMessage = error.toString();
      return null;
    }
  }

  void updateFinishedStatus() {
    _tasks
        .where((element) => !element.isFinished && !element.isPaused)
        .forEach((element) {
      if (element.remainingDuration <= 0) {
        element.isFinished = true;
        _playSoundUseCase.playAudio();
      }
    });
  }

  Future<void> dispose() async {
    _mTimer?.cancel();
    GetIt.I.get<AudioService>().dispose();
    await GetIt.I.get<db.TaskDatabase>().close();
    await GetIt.I.reset();
  }

  void updateInMemoryTask(TaskEntity updatedTask) {
    _tasks[_tasks.indexWhere((element) => element.id == updatedTask.id)] =
        updatedTask.toTaskState;
  }
}
