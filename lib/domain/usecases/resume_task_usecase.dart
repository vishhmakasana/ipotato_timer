import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class ResumeTaskUseCase {
  Future<TaskEntity> resumeTask(int taskId);
}

class ResumeTaskUseCaseImpl implements ResumeTaskUseCase {
  final TaskRepository taskRepository;

  ResumeTaskUseCaseImpl(this.taskRepository);

  @override
  Future<TaskEntity> resumeTask(int taskId) {
    return taskRepository.resumeTask(taskId);
  }
}
