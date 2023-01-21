import 'package:ipotato_timer/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<int> addTask(TaskEntity taskEntity);

  Future<bool> deleteTask(int taskId);

  Future<TaskEntity> getAllTask();

  Future<TaskEntity> pauseTask(DateTime pausedTime, int taskId);

  Future<TaskEntity> resumeTask(int taskId);
}