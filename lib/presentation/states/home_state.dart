import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  final _getAllTasksUseCase = GetIt.I.get<GetAllTaskUseCase>();
  final _addTaskUseCase = GetIt.I.get<AddTaskUseCase>();
  final _getTasksUseCase = GetIt.I.get<GetTaskUseCase>();
  final _pauseTaskUseCase = GetIt.I.get<PauseTaskUseCase>();
  final _resumeTaskUseCase = GetIt.I.get<ResumeTaskUseCase>();
  final _deleteTaskUseCase = GetIt.I.get<DeleteTaskUseCase>();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<TaskEntity> _tasks = ObservableList<TaskEntity>();

  @computed
  ObservableList<TaskEntity> get sortedTasks =>
      ObservableList.of(_tasks.sorted());

  @action
  Future<void> initialize() async {
    isLoading = true;
    await _loadAllTasks();
    isLoading = false;
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
    isLoading = true;
    final creationTime = DateTime.now();

    TaskEntity task = TaskEntity(
      title: title,
      description: description,
      creationTime: creationTime,
      taskDuration: taskDuration,
    );

    final taskId = await _addTaskUseCase.addTask(task);
    task.id = taskId;
    _tasks.add(task);
    isLoading = false;
    return taskId;
  }

  @action
  Future<bool> pauseTask({
    required TaskId taskId,
  }) async {
    final pauseTime = DateTime.now();
    final result = await _pauseTaskUseCase.pauseTask(pauseTime, taskId);
    if (result) {
      final updatedTask = await _getTasksUseCase.getTask(taskId);
      if (updatedTask != null) {
        _tasks[_tasks.indexWhere((element) => element.id == taskId)] =
            updatedTask;
      }
    }
    return true;
  }

  @action
  Future<bool> resumeTask({
    required TaskId taskId,
    required DateTime? pausedTime,
    required Duration pausedDuration,
  }) async {
    if (pausedTime == null) return Future.value(false);
    final resumeTime = DateTime.now();
    final result = await _resumeTaskUseCase.resumeTask(
      pausedDuration: pausedDuration,
      pausedTime: pausedTime,
      taskId: taskId,
      resumeTime: resumeTime,
    );

    if (!result) return false;

    final updatedTask = await _getTasksUseCase.getTask(taskId);
    if (updatedTask != null) {
      _tasks[_tasks.indexWhere((element) => element.id == taskId)] =
          updatedTask;
    }
    return true;
  }

  @action
  Future<bool> deleteTask({
    required TaskId taskId,
  }) async {
    final result = await _deleteTaskUseCase.deleteTask(
      taskId,
    );

    if (!result) return false;

    _tasks.removeWhere((element) => element.id == taskId);

    return true;
  }

  @action
  Future<TaskEntity?> getTask({
    required TaskId taskId,
  }) async {
    return await _getTasksUseCase.getTask(
      taskId,
    );
  }
}

extension ToInt on bool {
  int toInteger() => this ? 1 : 0;
}

extension Sorted on List<TaskEntity> {
  List<TaskEntity> sorted() => [...this]..sort(
      (lhs, rhs) {
        final isFinished = lhs.isFinished.toInteger().compareTo(
              rhs.isFinished.toInteger(),
            );
        if (isFinished != 0) {
          return isFinished;
        }
        return rhs.creationTime.compareTo(lhs.creationTime);
      },
    );
}
