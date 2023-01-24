import 'dart:async';

import 'package:drift/drift.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/data/mapper/local_task_entity_mapper.dart';

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
  Future<TaskEntity?> getTask(TaskId taskId) async {
    if (taskId == null) return Future.value(null);
    final query = taskDatabase.select(taskDatabase.tasks);
    return (await (query..where((t) => t.id.equals(taskId))).getSingleOrNull())
        ?.toTaskEntity;
  }

  @override
  Future<List<TaskEntity>> getAllTask() {
    final query = taskDatabase.select(taskDatabase.tasks);
    return query
        .map(
          (row) => row.toTaskEntity,
        )
        .get();
  }

  @override
  Future<bool> deleteTask(TaskId taskId) async {
    if (taskId == null) return Future.value(false);
    final deleted = await (taskDatabase.delete(taskDatabase.tasks)
          ..where((t) => t.id.equals(taskId)))
        .go();
    return deleted > 0;
  }

  @override
  Future<bool> pauseTask(DateTime pausedTime, TaskId taskId) async {
    if (taskId == null) return Future.value(false);
    final query = taskDatabase.update(taskDatabase.tasks);
    final result = await (query..where((t) => t.id.equals(taskId))).write(
      TasksCompanion(
        pausedTime: Value(pausedTime),
      ),
    );
    return result > 0;
  }

  @override
  Future<bool> resumeTask({
    required Duration pausedDuration,
    required DateTime? pausedTime,
    required DateTime resumeTime,
    required TaskId taskId,
  }) async {
    if (pausedTime == null || taskId == null) return false;
    final currPausedDuration = resumeTime.difference(pausedTime);
    final query = taskDatabase.update(taskDatabase.tasks);
    final result = await (query..where((t) => t.id.equals(taskId))).write(
      TasksCompanion(
        pausedTime: const Value(null),
        pausedDuration:
            Value(pausedDuration.inSeconds + currPausedDuration.inSeconds),
      ),
    );
    return result > 0;
  }
}
