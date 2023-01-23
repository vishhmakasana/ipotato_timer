import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';

extension StateToTaskEntity on Task {
  TaskEntity get toTaskState => TaskEntity(
        id: id!,
        title: title,
        description: description,
        taskDuration: Duration(seconds: taskDuration),
        creationTime: creationTime,
        pausedTime: pausedTime,
        pausedDuration: Duration(seconds: pausedDuration),
      );
}
