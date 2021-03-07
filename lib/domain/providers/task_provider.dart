import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/components/enums.dart';

class TaskProvider extends ChangeNotifier {
  Task _taskData;

  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  Task get taskData => _taskData;

  void updateTodo(Task task) {
    _taskData = task;
    notifyListeners();
  }

  void changeDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }
}
