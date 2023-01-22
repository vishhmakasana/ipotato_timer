import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/core/database/database.dart';

void main() {
  late TaskDatabase database;

  const taskId = 101;
  const title = 'Task #101';
  const description = 'Description of Task #101';
  const taskDurationInSeconds = 5;
  final DateTime creationTime = DateTime.now();
  const fooId = 102;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    database = TaskDatabase.forTesting(NativeDatabase.memory());
  });

  test('Initial tasks list should be empty', () async {
    final taskList = await database.select(database.tasks).get();
    expect(taskList.isEmpty, true);
  });

  test('Inserting task', () async {
    await database.into(database.tasks).insert(
          TasksCompanion.insert(
            id: const Value(taskId),
            title: title,
            description: description,
            creationTime: creationTime,
            taskDuration: taskDurationInSeconds,
          ),
        );

    final query = database.select(database.tasks);
    final task =
        await (query..where((t) => t.id.equals(taskId))).getSingleOrNull();
    expect(task != null, true);

    final task2 =
        await (query..where((t) => t.id.equals(fooId))).getSingleOrNull();
    expect(task2 == null, true);
  });

  test('Updating task', () async {
    await database.into(database.tasks).insert(
          TasksCompanion.insert(
            id: const Value(taskId),
            title: title,
            description: description,
            creationTime: creationTime,
            taskDuration: taskDurationInSeconds,
          ),
        );

    // swapping title and descriptions
    final updateQuery = database.update(database.tasks);
    (updateQuery..where((t) => t.id.equals(taskId))).write(
      const TasksCompanion(
        title: Value(description),
        description: Value(title),
      ),
    );

    final query = database.select(database.tasks);
    final task =
        await (query..where((t) => t.id.equals(taskId))).getSingleOrNull();
    expect(task != null, true);
    expect(task?.title, description);
    expect(task?.description, title);
  });

  test('Deleting task', () async {
    await database.into(database.tasks).insert(
          TasksCompanion.insert(
            id: const Value(taskId),
            title: title,
            description: description,
            creationTime: creationTime,
            taskDuration: taskDurationInSeconds,
          ),
        );

    final query = database.select(database.tasks);
    var task =
        await (query..where((t) => t.id.equals(taskId))).getSingleOrNull();
    expect(task != null, true);

    final deleteQuery = database.delete(database.tasks);
    (deleteQuery..where((t) => t.id.equals(taskId))).go();

    task = await (query..where((t) => t.id.equals(taskId))).getSingleOrNull();
    expect(task == null, true);
  });

  test('Reading task', () async {
    await database.into(database.tasks).insert(
          TasksCompanion.insert(
            id: const Value(taskId),
            title: title,
            description: description,
            creationTime: creationTime,
            taskDuration: taskDurationInSeconds,
          ),
        );

    final query = database.select(database.tasks);
    var task =
        await (query..where((t) => t.id.equals(taskId))).getSingleOrNull();
    expect(task != null, true);
    expect(task?.title, title);
    expect(task?.description, description);
    expect(task?.id, taskId);
    expect(task?.taskDuration, taskDurationInSeconds);
    expect(task?.pausedTime, null);
    expect(task?.pausedDuration, 0);
  });

  tearDown(() async {
    await database.close();
  });
}
