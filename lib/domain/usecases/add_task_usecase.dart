import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

abstract class AddTaskUseCase {
  Future<int> addTask(TaskEntity taskEntity);
}

class AddTaskUseCaseImpl implements AddTaskUseCase {
  final TaskRepository taskRepository;

  AddTaskUseCaseImpl(this.taskRepository);

  @override
  Future<int> addTask(TaskEntity taskEntity) {
    return taskRepository.addTask(taskEntity);
  }
}
