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
  Future<TaskEntity?> getTask(int taskId) async {
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
  Future<bool> deleteTask(int taskId) async {
    final deleted = await (taskDatabase.delete(taskDatabase.tasks)
          ..where((t) => t.id.equals(taskId)))
        .go();
    return deleted > 0;
  }

  @override
  Future<bool> pauseTask(DateTime pausedTime, int taskId) async {
    final query = taskDatabase.update(taskDatabase.tasks);
    final result = await (query..where((t) => t.id.equals(taskId))).write(
      TasksCompanion(
        pausedTime: Value(pausedTime),
      ),
    );
    return result > 0;
  }

  @override
  Future<bool> resumeTask(
      DateTime? pausedTime, DateTime resumeTime, int taskId) async {
    if (pausedTime == null) return false;
    final pausedDuration = resumeTime.difference(pausedTime);
    final query = taskDatabase.update(taskDatabase.tasks);
    final result = await (query..where((t) => t.id.equals(taskId))).write(
      TasksCompanion(
          pausedTime: const Value(null),
          pausedDuration: Value(pausedDuration.inSeconds) // calculate it
          ),
    );
    return result > 0;
  }
}
