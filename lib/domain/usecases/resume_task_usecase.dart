import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class ResumeTaskUseCase {
  Future<bool> resumeTask(
      DateTime? pausedTime, DateTime resumeTime, int taskId);
}

class ResumeTaskUseCaseImpl implements ResumeTaskUseCase {
  final TaskRepository taskRepository;

  ResumeTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> resumeTask(
      DateTime? pausedTime, DateTime resumeTime, int taskId) {
    return taskRepository.resumeTask(pausedTime, resumeTime, taskId);
  }
}
