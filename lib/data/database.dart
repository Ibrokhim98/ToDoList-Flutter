import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get taskTitle => text()();

  DateTimeColumn get targetDate => dateTime().nullable()();

  TextColumn get status => text()();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;

  Future<List<Task>> getAllTask() => select(tasks).get();
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();
  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future deleteTask(Task task) => delete(tasks).delete(task);
  Future updateTask(Task task) => update(tasks).replace(task);
}
