import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class PauseTaskUseCase {
  Future<bool> pauseTask(DateTime pausedTime, int taskId);
}

class PauseTaskUseCaseImpl implements PauseTaskUseCase {
  final TaskRepository taskRepository;

  PauseTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> pauseTask(DateTime pausedTime, int taskId) {
    return taskRepository.pauseTask(pausedTime, taskId);
  }
}
