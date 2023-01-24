import 'package:ipotato_timer/presentation/states/task_state.dart';

extension ToInt on bool {
  int toInteger() => this ? 1 : 0;
}

extension Sorted on List<Task> {
  List<Task> sorted() => [...this]..sort(
      (lhs, rhs) {
        final isFinished = rhs.isFinished.toInteger().compareTo(
              lhs.isFinished.toInteger(),
            );
        if (isFinished != 0) {
          return isFinished;
        }
        return rhs.creationTime.compareTo(lhs.creationTime);
      },
    );
}

extension ToDuration on int {
  Duration toDuration() => Duration(seconds: this);
}

extension StringToInt on String {
  int toInt() => isEmpty ? 0 : int.parse(this);
}

extension HourToSeconds on int {
  int hToSeconds() => this * 60 * 60;
}

extension MinuteToSeconds on int {
  int mToSeconds() => this * 60;
}
