import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class PauseTaskUseCase {
  Future<TaskEntity> pauseTask(DateTime pausedTime, int taskId);
}

class PauseTaskUseCaseImpl implements PauseTaskUseCase {
  final TaskRepository taskRepository;

  PauseTaskUseCaseImpl(this.taskRepository);

  @override
  Future<TaskEntity> pauseTask(DateTime pausedTime, int taskId) {
    return taskRepository.pauseTask(pausedTime, taskId);
  }
}
