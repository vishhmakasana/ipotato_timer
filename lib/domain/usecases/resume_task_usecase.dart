import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ResumeTaskUseCase {
  Future<Result<bool, Exception>> resumeTask({
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
  Future<Result<bool, Exception>> resumeTask({
    required Duration pausedDuration,
    required DateTime? pausedTime,
    required DateTime resumeTime,
    required TaskId taskId,
  }) async {
    try {
      final result = await taskRepository.resumeTask(
        pausedDuration: pausedDuration,
        pausedTime: pausedTime,
        resumeTime: resumeTime,
        taskId: taskId,
      );
      if (result) {
        return Success(result);
      } else {
        return Error(Exception('Task not resumed successfully'));
      }
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
