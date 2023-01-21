import 'package:ipotato_timer/database/database.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';

extension ToTaskEntity on Task {
  TaskEntity get toTaskEntity => TaskEntity(
        id: id,
        title: title,
        description: description,
        taskDuration: Duration(seconds: taskDuration),
        creationTime: creationTime,
        pausedTime: pausedTime,
        pausedDuration: Duration(seconds: pausedDuration),
      );
}
