// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_form_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTaskState on _AddTaskState, Store {
  Computed<int>? _$durationComputed;

  @override
  int get duration => (_$durationComputed ??=
          Computed<int>(() => super.duration, name: '_AddTaskState.duration'))
      .value;
  Computed<bool>? _$canAddTaskComputed;

  @override
  bool get canAddTask =>
      (_$canAddTaskComputed ??= Computed<bool>(() => super.canAddTask,
              name: '_AddTaskState.canAddTask'))
          .value;

  late final _$titleAtom = Atom(name: '_AddTaskState.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_AddTaskState.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$durationSecondsAtom =
      Atom(name: '_AddTaskState.durationSeconds', context: context);

  @override
  String get durationSeconds {
    _$durationSecondsAtom.reportRead();
    return super.durationSeconds;
  }

  @override
  set durationSeconds(String value) {
    _$durationSecondsAtom.reportWrite(value, super.durationSeconds, () {
      super.durationSeconds = value;
    });
  }

  late final _$durationMinutesAtom =
      Atom(name: '_AddTaskState.durationMinutes', context: context);

  @override
  String get durationMinutes {
    _$durationMinutesAtom.reportRead();
    return super.durationMinutes;
  }

  @override
  set durationMinutes(String value) {
    _$durationMinutesAtom.reportWrite(value, super.durationMinutes, () {
      super.durationMinutes = value;
    });
  }

  late final _$durationHoursAtom =
      Atom(name: '_AddTaskState.durationHours', context: context);

  @override
  String get durationHours {
    _$durationHoursAtom.reportRead();
    return super.durationHours;
  }

  @override
  set durationHours(String value) {
    _$durationHoursAtom.reportWrite(value, super.durationHours, () {
      super.durationHours = value;
    });
  }

  late final _$_AddTaskStateActionController =
      ActionController(name: '_AddTaskState', context: context);

  @override
  void validateTitle(String? value) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDescription(String? value) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.validateDescription');
    try {
      return super.validateDescription(value);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDuration(int duration) {
    final _$actionInfo = _$_AddTaskStateActionController.startAction(
        name: '_AddTaskState.validateDuration');
    try {
      return super.validateDuration(duration);
    } finally {
      _$_AddTaskStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
durationSeconds: ${durationSeconds},
durationMinutes: ${durationMinutes},
durationHours: ${durationHours},
duration: ${duration},
canAddTask: ${canAddTask}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$titleAtom =
      Atom(name: '_FormErrorState.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormErrorState.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_FormErrorState.duration', context: context);

  @override
  String? get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(String? value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
duration: ${duration},
hasErrors: ${hasErrors}
    ''';
  }
}
