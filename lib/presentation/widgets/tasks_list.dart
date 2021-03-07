import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/domain/blocs/todos_bloc.dart';
import 'package:to_do_list/components/enums.dart';
import 'package:to_do_list/presentation/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final Pages page;
  const TasksList({Key key, this.page}) : super(key: key);
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodosBloc>(context)..add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (BuildContext context, TodosState state) {
        if (state is TodosLoaded) {
          if (widget.page == Pages.processing) {
            tasks = state.tasks.where((element) => element.status == EnumToString.convertToString(Status.processing)).toList();
          } else if (widget.page == Pages.complete) {
            tasks = state.tasks.where((element) => element.status == EnumToString.convertToString(Status.complete)).toList();
          } else {
            tasks = state.tasks;
          }
        }

        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                task: tasks[index],
              );
            },
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
