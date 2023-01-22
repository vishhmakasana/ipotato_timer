import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class GetAllTaskUseCase {
  Future<List<TaskEntity>> getAllTask();
}

class GetAllTaskUseCaseImpl implements GetAllTaskUseCase {
  final TaskRepository taskRepository;

  GetAllTaskUseCaseImpl(this.taskRepository);

  @override
  Future<List<TaskEntity>> getAllTask() {
    return taskRepository.getAllTask();
  }
}
