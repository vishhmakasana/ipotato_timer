import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class ResumeTaskUseCase {
  Future<bool> resumeTask({
    required Duration pausedDuration,
    required DateTime? pausedTime,
    required DateTime resumeTime,
    required TaskId taskId,
  });
}

class ResumeTaskUseCaseImpl implements ResumeTaskUseCase {
  final TaskRepository taskRepository;

  ResumeTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> resumeTask({
    required Duration pausedDuration,
    required DateTime? pausedTime,
    required DateTime resumeTime,
    required TaskId taskId,
  }) {
    return taskRepository.resumeTask(
      pausedDuration: pausedDuration,
      pausedTime: pausedTime,
      resumeTime: resumeTime,
      taskId: taskId,
    );
  }
}
