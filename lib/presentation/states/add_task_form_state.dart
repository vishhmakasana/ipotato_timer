import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:mobx/mobx.dart';

part 'add_task_form_state.g.dart';

// ignore: library_private_types_in_public_api
class AddTaskState = _AddTaskState with _$AddTaskState;

abstract class _AddTaskState with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String durationSeconds = '';

  @observable
  String durationMinutes = '';

  @observable
  String durationHours = '';

  @computed
  int get duration =>
      durationHours.toInt().hToSeconds() +
      durationMinutes.toInt().mToSeconds() +
      durationSeconds.toInt();

  @computed
  bool get canAddTask => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => title, validateTitle),
      reaction((_) => description, validateDescription),
      reaction((_) => duration, validateDuration),
    ];
  }

  @action
  void validateTitle(String? value) {
    error.title = value == null || value.isEmpty
        ? 'Title cannot be blank'
        : value.length < 3
            ? 'Title should be at least 3 characters long'
            : null;
  }

  @action
  void validateDescription(String? value) {
    error.description =
        value == null || value.isEmpty ? 'Description cannot be blank' : null;
  }

  @action
  void validateDuration(int duration) {
    error.duration = duration == 0 ? 'Task duration cannot be zero' : null;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  Future<bool> validateAll() async {
    validateTitle(title);
    validateDescription(description);
    validateDuration(duration);
    if (canAddTask) {
      await GetIt.I.get<HomeState>().addTask(
            title: title,
            description: description,
            taskDuration: Duration(seconds: duration),
          );
      return Future.value(true);
    }
    return Future.value(false);
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? title;

  @observable
  String? description;

  @observable
  String? duration;

  @computed
  bool get hasErrors =>
      title != null || description != null || duration != null;
}
