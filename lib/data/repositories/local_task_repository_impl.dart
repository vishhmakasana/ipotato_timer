import 'package:drift/drift.dart';
import 'package:ipotato_timer/database/database.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';

class LocalTaskRepositoryImpl implements TaskRepository {
  final TaskDatabase taskDatabase;

  LocalTaskRepositoryImpl(this.taskDatabase);

  @override
  Future<int> addTask(TaskEntity taskEntity) {
    return taskDatabase.into(taskDatabase.tasks).insert(
          TasksCompanion.insert(
            title: taskEntity.title,
            description: taskEntity.description,
            creationTime: taskEntity.creationTime,
            taskDuration: taskEntity.taskDuration.inSeconds,
          ),
        );
  }

  @override
  Future<bool> deleteTask(int taskId) async {
    final deleted = await (taskDatabase.delete(taskDatabase.tasks)
          ..where((t) => t.id.equals(taskId)))
        .go();
    return deleted > 0;
  }

  @override
  Future<List<TaskEntity>> getAllTask() {
    final query = taskDatabase.select(taskDatabase.tasks);
    return query
        .map(
          (row) => TaskEntity(
            id: row.id,
            title: row.title,
            description: row.description,
            taskDuration: Duration(seconds: row.taskDuration),
            creationTime: row.creationTime,
            pausedTime: row.pausedTime,
            pausedDuration: Duration(seconds: row.pausedDuration),
          ),
        )
        .get();
  }

  @override
  Future<bool> pauseTask(DateTime pausedTime, int taskId) async {
    return (await (taskDatabase.update(taskDatabase.tasks)
              ..where((t) => t.id.equals(taskId)))
            .write(
          TasksCompanion(
            pausedTime: Value(pausedTime),
          ),
        ) >
        0);
  }

  @override
  Future<bool> resumeTask(
      DateTime? pausedTime, DateTime resumeTime, int taskId) async {
    if (pausedTime == null) return false;

    final pausedDuration = resumeTime.difference(pausedTime);

    return (await (taskDatabase.update(taskDatabase.tasks)
              ..where((t) => t.id.equals(taskId)))
            .write(
          TasksCompanion(
              pausedTime: const Value(null),
              pausedDuration: Value(pausedDuration.inSeconds) // calculate it
              ),
        ) >
        0);
  }
}
