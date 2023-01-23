import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';

extension EntityToTaskState on TaskEntity {
  Task get toTaskState => Task(
        id: id!,
        title: title,
        description: description,
        taskDuration: taskDuration.inSeconds,
        creationTime: creationTime,
        pausedTime: pausedTime,
        pausedDuration: pausedDuration.inSeconds,
        isFinished: isFinished,
      );
}
