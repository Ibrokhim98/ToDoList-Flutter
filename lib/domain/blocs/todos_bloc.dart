import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/domain/todos_repository.dart';
import 'package:to_do_list/components/enums.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository repository;

  TodosBloc({@required this.repository}) : super(TodosLoading());

  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodosToState(event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodosToState(event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodosToState(event);
    }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    List<Task> tasks = await repository.loadTodos();
    yield TodosLoaded(tasks);
  }

  Stream<TodosState> _mapAddTodosToState(AddTodo event) async* {
    yield TodosLoading();
    repository.addTodos(event.taskTitle, event.targetDate, event.status);
    List<Task> addedTasks = await repository.loadTodos();
    print(addedTasks);
    yield TodosLoaded(addedTasks);
  }

  Stream<TodosState> _mapUpdateTodosToState(UpdateTodo event) async* {
    yield TodosLoading();
    repository.updateTodos(event.updatedTask);
    List<Task> updatedTasks = await repository.loadTodos();
    yield TodosLoaded(updatedTasks);
  }

  Stream<TodosState> _mapDeleteTodosToState(DeleteTodo event) async* {
    yield TodosLoading();
    repository.deleteTodos(event.task);
    List<Task> deletedTasks = await repository.loadTodos();
    yield TodosLoaded(deletedTasks);
  }
}
