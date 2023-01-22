import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/data/repositories/local_task_repository_impl.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';

class Inject {
  static init() {
    initDataBase();
    initRepositories();
    initUseCases();
    initStates();
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
    GetIt.I.registerLazySingleton<GetTaskUseCase>(
        () => GetTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<DeleteTaskUseCase>(
        () => DeleteTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<PauseTaskUseCase>(
        () => PauseTaskUseCaseImpl(GetIt.I()));
    GetIt.I.registerLazySingleton<ResumeTaskUseCase>(
        () => ResumeTaskUseCaseImpl(GetIt.I()));
  }

  static initStates() {
    GetIt.I.registerLazySingleton<HomeState>(() => HomeState());
  }
}
