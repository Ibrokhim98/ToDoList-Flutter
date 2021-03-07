import 'package:moor_flutter/moor_flutter.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/components/enums.dart';

class TodosRepository {
  final AppDatabase _database = AppDatabase();

  Future<List<Task>> loadTodos() async {
    return await _database.getAllTask();
  }

  Future<void> addTodos(String taskTitle, DateTime targetDate, String status) async {
    final task = TasksCompanion(taskTitle: Value(taskTitle), targetDate: Value(targetDate), status: Value(status));
    await _database.insertTask(task);
  }

  Future<void> updateTodos(Task task) async {
    await _database.updateTask(task);
  }

  Future<void> deleteTodos(Task task) async {
    await _database.deleteTask(task);
  }
}
