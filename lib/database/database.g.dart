// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  @override
  late final GeneratedColumn<DateTime> creationTime = GeneratedColumn<DateTime>(
      'creation_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _taskDurationMeta =
      const VerificationMeta('taskDuration');
  @override
  late final GeneratedColumn<int> taskDuration = GeneratedColumn<int>(
      'task_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pausedTimeMeta =
      const VerificationMeta('pausedTime');
  @override
  late final GeneratedColumn<DateTime> pausedTime = GeneratedColumn<DateTime>(
      'paused_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _pausedDurationMeta =
      const VerificationMeta('pausedDuration');
  @override
  late final GeneratedColumn<int> pausedDuration = GeneratedColumn<int>(
      'paused_duration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        creationTime,
        taskDuration,
        pausedTime,
        pausedDuration
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time']!, _creationTimeMeta));
    } else if (isInserting) {
      context.missing(_creationTimeMeta);
    }
    if (data.containsKey('task_duration')) {
      context.handle(
          _taskDurationMeta,
          taskDuration.isAcceptableOrUnknown(
              data['task_duration']!, _taskDurationMeta));
    } else if (isInserting) {
      context.missing(_taskDurationMeta);
    }
    if (data.containsKey('paused_time')) {
      context.handle(
          _pausedTimeMeta,
          pausedTime.isAcceptableOrUnknown(
              data['paused_time']!, _pausedTimeMeta));
    }
    if (data.containsKey('paused_duration')) {
      context.handle(
          _pausedDurationMeta,
          pausedDuration.isAcceptableOrUnknown(
              data['paused_duration']!, _pausedDurationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      creationTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_time'])!,
      taskDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_duration'])!,
      pausedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paused_time']),
      pausedDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paused_duration'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String description;
  final DateTime creationTime;
  final int taskDuration;
  final DateTime? pausedTime;
  final int pausedDuration;
  const Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.creationTime,
      required this.taskDuration,
      this.pausedTime,
      required this.pausedDuration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['creation_time'] = Variable<DateTime>(creationTime);
    map['task_duration'] = Variable<int>(taskDuration);
    if (!nullToAbsent || pausedTime != null) {
      map['paused_time'] = Variable<DateTime>(pausedTime);
    }
    map['paused_duration'] = Variable<int>(pausedDuration);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      creationTime: Value(creationTime),
      taskDuration: Value(taskDuration),
      pausedTime: pausedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(pausedTime),
      pausedDuration: Value(pausedDuration),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      creationTime: serializer.fromJson<DateTime>(json['creationTime']),
      taskDuration: serializer.fromJson<int>(json['taskDuration']),
      pausedTime: serializer.fromJson<DateTime?>(json['pausedTime']),
      pausedDuration: serializer.fromJson<int>(json['pausedDuration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'creationTime': serializer.toJson<DateTime>(creationTime),
      'taskDuration': serializer.toJson<int>(taskDuration),
      'pausedTime': serializer.toJson<DateTime?>(pausedTime),
      'pausedDuration': serializer.toJson<int>(pausedDuration),
    };
  }

  Task copyWith(
          {int? id,
          String? title,
          String? description,
          DateTime? creationTime,
          int? taskDuration,
          Value<DateTime?> pausedTime = const Value.absent(),
          int? pausedDuration}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        creationTime: creationTime ?? this.creationTime,
        taskDuration: taskDuration ?? this.taskDuration,
        pausedTime: pausedTime.present ? pausedTime.value : this.pausedTime,
        pausedDuration: pausedDuration ?? this.pausedDuration,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('taskDuration: $taskDuration, ')
          ..write('pausedTime: $pausedTime, ')
          ..write('pausedDuration: $pausedDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, creationTime,
      taskDuration, pausedTime, pausedDuration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.creationTime == this.creationTime &&
          other.taskDuration == this.taskDuration &&
          other.pausedTime == this.pausedTime &&
          other.pausedDuration == this.pausedDuration);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> creationTime;
  final Value<int> taskDuration;
  final Value<DateTime?> pausedTime;
  final Value<int> pausedDuration;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.taskDuration = const Value.absent(),
    this.pausedTime = const Value.absent(),
    this.pausedDuration = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required DateTime creationTime,
    required int taskDuration,
    this.pausedTime = const Value.absent(),
    this.pausedDuration = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        creationTime = Value(creationTime),
        taskDuration = Value(taskDuration);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? creationTime,
    Expression<int>? taskDuration,
    Expression<DateTime>? pausedTime,
    Expression<int>? pausedDuration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (creationTime != null) 'creation_time': creationTime,
      if (taskDuration != null) 'task_duration': taskDuration,
      if (pausedTime != null) 'paused_time': pausedTime,
      if (pausedDuration != null) 'paused_duration': pausedDuration,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? creationTime,
      Value<int>? taskDuration,
      Value<DateTime?>? pausedTime,
      Value<int>? pausedDuration}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creationTime: creationTime ?? this.creationTime,
      taskDuration: taskDuration ?? this.taskDuration,
      pausedTime: pausedTime ?? this.pausedTime,
      pausedDuration: pausedDuration ?? this.pausedDuration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime>(creationTime.value);
    }
    if (taskDuration.present) {
      map['task_duration'] = Variable<int>(taskDuration.value);
    }
    if (pausedTime.present) {
      map['paused_time'] = Variable<DateTime>(pausedTime.value);
    }
    if (pausedDuration.present) {
      map['paused_duration'] = Variable<int>(pausedDuration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('taskDuration: $taskDuration, ')
          ..write('pausedTime: $pausedTime, ')
          ..write('pausedDuration: $pausedDuration')
          ..write(')'))
        .toString();
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
