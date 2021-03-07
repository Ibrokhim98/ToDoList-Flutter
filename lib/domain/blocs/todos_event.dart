part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {
  const TodosEvent([List props = const []]) : super();
}

class LoadTodos extends TodosEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadTodos';
}

class AddTodo extends TodosEvent {
  @override
  List<Object> get props => [];

  final String taskTitle;
  final DateTime targetDate;
  final String status;

  AddTodo(this.taskTitle, this.targetDate, this.status);

  @override
  String toString() {
    return 'AddTodo{taskTitle: $taskTitle, targetDate: $targetDate, status: $status}';
  }
}

class UpdateTodo extends TodosEvent {
  @override
  List<Object> get props => [];

  final Task updatedTask;

  UpdateTodo(this.updatedTask) : super([updatedTask]);

  @override
  String toString() => 'UpdateTodo { updatedTask: $updatedTask }';
}

class DeleteTodo extends TodosEvent {
  @override
  List<Object> get props => [];

  final Task task;

  DeleteTodo(this.task) : super([task]);

  @override
  String toString() => 'DeleteTodo { task: $task }';
}
