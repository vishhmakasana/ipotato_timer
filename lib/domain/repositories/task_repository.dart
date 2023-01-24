import 'package:ipotato_timer/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<int> addTask(TaskEntity taskEntity);

  Future<TaskEntity?> getTask(TaskId taskId);

  Future<List<TaskEntity>> getAllTask();

  Future<bool> deleteTask(TaskId taskId);

  Future<bool> pauseTask(DateTime pausedTime, TaskId taskId);

  Future<bool> resumeTask({
    required Duration pausedDuration,
    required DateTime? pausedTime,
    required DateTime resumeTime,
    required TaskId taskId,
  });
}
