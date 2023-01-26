import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class PauseTaskUseCase {
  Future<Result<bool, Exception>> pauseTask(DateTime pausedTime, TaskId taskId);
}

class PauseTaskUseCaseImpl implements PauseTaskUseCase {
  final TaskRepository taskRepository;

  PauseTaskUseCaseImpl(this.taskRepository);

  @override
  Future<Result<bool, Exception>> pauseTask(
      DateTime pausedTime, TaskId taskId) async {
    try {
      final result = await taskRepository.pauseTask(pausedTime, taskId);
      if (result) {
        return Success(result);
      } else {
        return Error(Exception('Task not paused successfully'));
      }
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
