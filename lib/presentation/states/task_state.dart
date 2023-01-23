import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:mobx/mobx.dart';

part 'task_state.g.dart';

// ignore: library_private_types_in_public_api
class Task = _Task with _$Task;

abstract class _Task with Store {
  final TaskId id;
  final String title;
  final String description;
  final DateTime creationTime;
  final int taskDuration;

  @observable
  DateTime? pausedTime;

  @computed
  bool get isPaused => pausedTime != null;

  @observable
  int pausedDuration;

  @observable
  bool isFinished;

  _Task({
    required this.id,
    required this.title,
    required this.description,
    required this.creationTime,
    required this.taskDuration,
    required this.pausedTime,
    required this.pausedDuration,
    required this.isFinished,
  });

  int get elapsedDuration =>
      (pausedTime ?? DateTime.now()).difference(creationTime).inSeconds -
      pausedDuration;

  int get remainingDuration =>
      taskDuration -
      ((pausedTime ?? DateTime.now()).difference(creationTime).inSeconds -
          pausedDuration);
}
