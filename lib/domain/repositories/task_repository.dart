import 'package:ipotato_timer/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<int> addTask(TaskEntity taskEntity);

  Future<bool> deleteTask(int taskId);

  Future<List<TaskEntity>> getAllTask();

  Future<bool> pauseTask(DateTime pausedTime, int taskId);

  Future<bool> resumeTask(DateTime? pausedTime, DateTime resumeTime, int taskId);
}
