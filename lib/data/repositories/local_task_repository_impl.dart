import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

class LocalTaskRepositoryImpl implements TaskRepository {
  @override
  Future<int> addTask(TaskEntity taskEntity) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity> getAllTask() {
    // TODO: implement getAllTask
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity> pauseTask(DateTime pausedTime, int taskId) {
    // TODO: implement pauseTask
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity> resumeTask(int taskId) {
    // TODO: implement resumeTask
    throw UnimplementedError();
  }
}
