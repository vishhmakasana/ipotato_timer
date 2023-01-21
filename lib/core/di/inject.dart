import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/data/repositories/local_task_repository_impl.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/database/database.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Inject {
  static init() {
    initDataBase();
    initRepositories();
    initUseCases();
  }

  static initDataBase() {
    GetIt.I.registerSingleton<TaskDatabase>(TaskDatabase());
  }

  static initRepositories() {
    GetIt.I.registerLazySingleton<TaskRepository>(
        () => LocalTaskRepositoryImpl(GetIt.I()));
  }

  static initUseCases() {
    GetIt.I.registerLazySingleton<AddTaskUseCase>(
        () => AddTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<GetAllTaskUseCase>(
        () => GetAllTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<DeleteTaskUseCase>(
        () => DeleteTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<PauseTaskUseCase>(
        () => PauseTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<ResumeTaskUseCase>(
        () => ResumeTaskUseCaseImpl(GetIt.I()));
  }

  static LazyDatabase openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
