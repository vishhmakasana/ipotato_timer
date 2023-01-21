import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  DateTimeColumn get creationTime => dateTime()();

  IntColumn get taskDuration => integer()();

  DateTimeColumn get pausedTime => dateTime().nullable()();

  IntColumn get pausedDuration => integer().withDefault(const Constant(0))();
}