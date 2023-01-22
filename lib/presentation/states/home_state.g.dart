// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on HomeStateBase, Store {
  Computed<ObservableList<TaskEntity>>? _$sortedTasksComputed;

  @override
  ObservableList<TaskEntity> get sortedTasks => (_$sortedTasksComputed ??=
          Computed<ObservableList<TaskEntity>>(() => super.sortedTasks,
              name: 'HomeStateBase.sortedTasks'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'HomeStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_tasksAtom =
      Atom(name: 'HomeStateBase._tasks', context: context);

  @override
  ObservableList<TaskEntity> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<TaskEntity> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('HomeStateBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$_loadAllTasksAsyncAction =
      AsyncAction('HomeStateBase._loadAllTasks', context: context);

  @override
  Future<bool> _loadAllTasks() {
    return _$_loadAllTasksAsyncAction.run(() => super._loadAllTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('HomeStateBase.addTask', context: context);

  @override
  Future<int?> addTask(
      {required String title,
      required String description,
      required Duration taskDuration}) {
    return _$addTaskAsyncAction.run(() => super.addTask(
        title: title, description: description, taskDuration: taskDuration));
  }

  late final _$pauseTaskAsyncAction =
      AsyncAction('HomeStateBase.pauseTask', context: context);

  @override
  Future<bool> pauseTask({required int? taskId}) {
    return _$pauseTaskAsyncAction.run(() => super.pauseTask(taskId: taskId));
  }

  late final _$resumeTaskAsyncAction =
      AsyncAction('HomeStateBase.resumeTask', context: context);

  @override
  Future<bool> resumeTask(
      {required int? taskId,
      required DateTime? pausedTime,
      required Duration pausedDuration}) {
    return _$resumeTaskAsyncAction.run(() => super.resumeTask(
        taskId: taskId,
        pausedTime: pausedTime,
        pausedDuration: pausedDuration));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('HomeStateBase.deleteTask', context: context);

  @override
  Future<bool> deleteTask({required int? taskId}) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(taskId: taskId));
  }

  late final _$getTaskAsyncAction =
      AsyncAction('HomeStateBase.getTask', context: context);

  @override
  Future<TaskEntity?> getTask({required int? taskId}) {
    return _$getTaskAsyncAction.run(() => super.getTask(taskId: taskId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
sortedTasks: ${sortedTasks}
    ''';
  }
}
