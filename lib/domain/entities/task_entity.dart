class TaskEntity {
  /// an optional integer that can be used to identify the task.
  final int? id;

  /// a required string that represents the title of the task.
  final String title;

  /// a required string that provides more information about the task.
  final String description;

  /// a required DateTime object that represents the time the task was created.
  final DateTime creationTime;

  /// a required Duration object that represents the total duration of the task.
  final Duration taskDuration;

  ///  an optional DateTime object that represents the time the task was last paused.
  DateTime? pausedTime;

  /// a Duration object that represents the total duration of time the task was paused.
  /// The default value is zero.
  Duration pausedDuration;

  TaskEntity({
    this.id,
    required this.title,
    required this.description,
    required this.creationTime,
    required this.taskDuration,
    this.pausedTime,
    this.pausedDuration = Duration.zero,
  });

  ///  a getter property that calculates the total active duration of the task
  ///  by subtracting the [pausedDuration] from the difference
  ///  between [creationTime] and either [pausedTime]
  ///  if it's not null or DateTime.now() if it is.
  Duration get elapsedDuration =>
      (pausedTime ?? DateTime.now()).difference(creationTime) - pausedDuration;

  /// a getter property that calculates the remaining duration of the
  /// task by subtracting the elapsed duration from the [taskDuration].
  Duration get remainingDuration =>
      taskDuration -
      ((pausedTime ?? DateTime.now()).difference(creationTime) -
          pausedDuration);

  /// a getter property that checks if the [remainingDuration]
  /// of the task is less than or equal to zero.
  bool get isFinished => remainingDuration <= Duration.zero;

  /// a getter property that checks if the task is currently
  /// paused by checking if the [pausedTime] property is not null.
  bool get isPaused => pausedTime != null;
}
