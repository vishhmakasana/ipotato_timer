import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class PauseTaskUseCase {
  Future<bool> pauseTask(DateTime pausedTime, TaskId taskId);
}

class PauseTaskUseCaseImpl implements PauseTaskUseCase {
  final TaskRepository taskRepository;

  PauseTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> pauseTask(DateTime pausedTime, TaskId taskId) {
    return taskRepository.pauseTask(pausedTime, taskId);
  }
}
