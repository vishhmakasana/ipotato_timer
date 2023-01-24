// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  Computed<ObservableList<Task>>? _$sortedTasksComputed;

  @override
  ObservableList<Task> get sortedTasks => (_$sortedTasksComputed ??=
          Computed<ObservableList<Task>>(() => super.sortedTasks,
              name: '_HomeState.sortedTasks'))
      .value;
  Computed<int>? _$activeTaskCountComputed;

  @override
  int get activeTaskCount =>
      (_$activeTaskCountComputed ??= Computed<int>(() => super.activeTaskCount,
              name: '_HomeState.activeTaskCount'))
          .value;
  Computed<bool>? _$isNoTasksFoundComputed;

  @override
  bool get isNoTasksFound =>
      (_$isNoTasksFoundComputed ??= Computed<bool>(() => super.isNoTasksFound,
              name: '_HomeState.isNoTasksFound'))
          .value;

  late final _$timeElapsedAtom =
      Atom(name: '_HomeState.timeElapsed', context: context);

  @override
  int get timeElapsed {
    _$timeElapsedAtom.reportRead();
    return super.timeElapsed;
  }

  @override
  set timeElapsed(int value) {
    _$timeElapsedAtom.reportWrite(value, super.timeElapsed, () {
      super.timeElapsed = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeState.isLoading', context: context);

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

  late final _$_tasksAtom = Atom(name: '_HomeState._tasks', context: context);

  @override
  ObservableList<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$_mTimerAtom = Atom(name: '_HomeState._mTimer', context: context);

  Timer? get mTimer {
    _$_mTimerAtom.reportRead();
    return super._mTimer;
  }

  @override
  Timer? get _mTimer => mTimer;

  @override
  set _mTimer(Timer? value) {
    _$_mTimerAtom.reportWrite(value, super._mTimer, () {
      super._mTimer = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_HomeState.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$_loadAllTasksAsyncAction =
      AsyncAction('_HomeState._loadAllTasks', context: context);

  @override
  Future<bool> _loadAllTasks() {
    return _$_loadAllTasksAsyncAction.run(() => super._loadAllTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_HomeState.addTask', context: context);

  @override
  Future<int?> addTask(
      {required String title,
      required String description,
      required Duration taskDuration}) {
    return _$addTaskAsyncAction.run(() => super.addTask(
        title: title, description: description, taskDuration: taskDuration));
  }

  late final _$pauseTaskAsyncAction =
      AsyncAction('_HomeState.pauseTask', context: context);

  @override
  Future<bool> pauseTask({required int? taskId}) {
    return _$pauseTaskAsyncAction.run(() => super.pauseTask(taskId: taskId));
  }

  late final _$resumeTaskAsyncAction =
      AsyncAction('_HomeState.resumeTask', context: context);

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
      AsyncAction('_HomeState.deleteTask', context: context);

  @override
  Future<bool> deleteTask({required int? taskId}) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(taskId: taskId));
  }

  late final _$getTaskAsyncAction =
      AsyncAction('_HomeState.getTask', context: context);

  @override
  Future<TaskEntity?> getTask({required int? taskId}) {
    return _$getTaskAsyncAction.run(() => super.getTask(taskId: taskId));
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  dynamic startTimer() {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeElapsed: ${timeElapsed},
isLoading: ${isLoading},
sortedTasks: ${sortedTasks},
activeTaskCount: ${activeTaskCount},
isNoTasksFound: ${isNoTasksFound}
    ''';
  }
}
