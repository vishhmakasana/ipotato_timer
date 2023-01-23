// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on _Task, Store {
  Computed<bool>? _$isPausedComputed;

  @override
  bool get isPaused => (_$isPausedComputed ??=
          Computed<bool>(() => super.isPaused, name: '_Task.isPaused'))
      .value;

  late final _$pausedTimeAtom =
      Atom(name: '_Task.pausedTime', context: context);

  @override
  DateTime? get pausedTime {
    _$pausedTimeAtom.reportRead();
    return super.pausedTime;
  }

  @override
  set pausedTime(DateTime? value) {
    _$pausedTimeAtom.reportWrite(value, super.pausedTime, () {
      super.pausedTime = value;
    });
  }

  late final _$pausedDurationAtom =
      Atom(name: '_Task.pausedDuration', context: context);

  @override
  int get pausedDuration {
    _$pausedDurationAtom.reportRead();
    return super.pausedDuration;
  }

  @override
  set pausedDuration(int value) {
    _$pausedDurationAtom.reportWrite(value, super.pausedDuration, () {
      super.pausedDuration = value;
    });
  }

  late final _$isFinishedAtom =
      Atom(name: '_Task.isFinished', context: context);

  @override
  bool get isFinished {
    _$isFinishedAtom.reportRead();
    return super.isFinished;
  }

  @override
  set isFinished(bool value) {
    _$isFinishedAtom.reportWrite(value, super.isFinished, () {
      super.isFinished = value;
    });
  }

  @override
  String toString() {
    return '''
pausedTime: ${pausedTime},
pausedDuration: ${pausedDuration},
isFinished: ${isFinished},
isPaused: ${isPaused}
    ''';
  }
}
