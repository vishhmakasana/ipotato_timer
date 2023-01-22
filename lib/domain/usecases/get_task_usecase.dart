import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class GetTaskUseCase {
  Future<TaskEntity?> getTask(TaskId taskId);
}

class GetTaskUseCaseImpl implements GetTaskUseCase {
  final TaskRepository taskRepository;

  GetTaskUseCaseImpl(this.taskRepository);

  @override
  Future<TaskEntity?> getTask(TaskId taskId) {
    return taskRepository.getTask(taskId);
  }
}
