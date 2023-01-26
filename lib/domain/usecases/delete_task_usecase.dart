import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class DeleteTaskUseCase {
  Future<Result<bool, Exception>> deleteTask(TaskId taskId);
}

class DeleteTaskUseCaseImpl implements DeleteTaskUseCase {
  final TaskRepository taskRepository;

  DeleteTaskUseCaseImpl(this.taskRepository);

  @override
  Future<Result<bool, Exception>> deleteTask(TaskId taskId) async {
    try {
      final result = await taskRepository.deleteTask(taskId);
      if (result) {
        return Success(result);
      } else {
        return Error(Exception('Task not deleted successfully'));
      }
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
