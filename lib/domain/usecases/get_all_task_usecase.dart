import 'package:ipotato_timer/domain/mapper/task_state_mapper.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';

abstract class GetAllTaskUseCase {
  Future<List<Task>> getAllTask();
}

class GetAllTaskUseCaseImpl implements GetAllTaskUseCase {
  final TaskRepository taskRepository;

  GetAllTaskUseCaseImpl(this.taskRepository);

  @override
  Future<List<Task>> getAllTask() async {
    final results = await taskRepository.getAllTask();
    return Future.value(results.map((e) => e.toTaskState).toList());
  }
}
