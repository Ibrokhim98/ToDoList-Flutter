part of 'todos_bloc.dart';

@immutable
abstract class TodosState extends Equatable {
  const TodosState([List props = const []]) : super();
}

class TodosLoading extends TodosState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TodosLoading';
  }
}

class TodosLoaded extends TodosState {
  final List<Task> tasks;

  TodosLoaded([this.tasks = const []]) : super(tasks);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TodosLoaded{tasks: $tasks}';
  }
}

class TodosNotLoaded extends TodosState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'TodosNotLoaded';
}
