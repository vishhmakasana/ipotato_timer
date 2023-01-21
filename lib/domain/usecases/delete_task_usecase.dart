import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class DeleteTaskUseCase {
  Future<bool> deleteTask(int taskId);
}

class DeleteTaskUseCaseImpl implements DeleteTaskUseCase {
  final TaskRepository taskRepository;

  DeleteTaskUseCaseImpl(this.taskRepository);

  @override
  Future<bool> deleteTask(int taskId) {
    return taskRepository.deleteTask(taskId);
  }
}
