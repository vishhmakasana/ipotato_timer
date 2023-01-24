import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class DeleteTaskUseCase {
  Future<bool> deleteTask(TaskId taskId);
}

class DeleteTaskUseCaseImpl implements DeleteTaskUseCase {
  final TaskRepository taskRepository;

  DeleteTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> deleteTask(TaskId taskId) {
    return taskRepository.deleteTask(taskId);
  }
}
