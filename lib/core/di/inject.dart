import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/audio/audio_service.dart';
import 'package:ipotato_timer/core/database/database.dart';
import 'package:ipotato_timer/data/repositories/local_task_repository_impl.dart';
import 'package:ipotato_timer/domain/repositories/task_repository.dart';
import 'package:ipotato_timer/domain/usecases/play_sound_usecase.dart';
import 'package:ipotato_timer/domain/usecases/usecases.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:just_audio/just_audio.dart';

class Inject {
  static init() {
    initDataBase();
    initRepositories();
    initAudioService();
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

  static initAudioService() {
    GetIt.I.registerLazySingleton<AudioService>(
        () => JustAudioService(player: AudioPlayer()));
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
    GetIt.I.registerLazySingleton<PlaySoundUseCase>(
        () => PlaySoundUseCaseImpl(GetIt.I()));
  }

  static initStates() {
    GetIt.I.registerLazySingleton<HomeState>(() => HomeState());
  }
}
