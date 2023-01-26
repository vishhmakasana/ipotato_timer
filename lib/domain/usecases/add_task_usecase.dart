import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AddTaskUseCase {
  Future<Result<int, Exception>> addTask(TaskEntity taskEntity);
}

class AddTaskUseCaseImpl implements AddTaskUseCase {
  final TaskRepository taskRepository;

  AddTaskUseCaseImpl(this.taskRepository);

  @override
  Future<Result<int, Exception>> addTask(TaskEntity taskEntity) async {
    try {
      final result = await taskRepository.addTask(taskEntity);
      return Success(result);
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
