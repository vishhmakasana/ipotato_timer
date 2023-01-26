import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class GetTaskUseCase {
  Future<Result<TaskEntity, Exception>> getTask(TaskId taskId);
}

class GetTaskUseCaseImpl implements GetTaskUseCase {
  final TaskRepository taskRepository;

  GetTaskUseCaseImpl(this.taskRepository);

  @override
  Future<Result<TaskEntity, Exception>> getTask(TaskId taskId) async {
    try {
      final result = await taskRepository.getTask(taskId);
      if (result != null) {
        return Success(result);
      } else {
        return Error(Exception('Task not found'));
      }
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
