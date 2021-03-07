import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:provider/provider.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/domain/blocs/todos_bloc.dart';
import 'package:to_do_list/domain/providers/task_provider.dart';
import 'package:to_do_list/components/enums.dart';
import 'package:to_do_list/presentation/widgets/status_change_widget.dart';

import '../../components/styles.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<TodosBloc>(context);
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 6.0,
            ),
            child: Text(
              getTitle(task.targetDate, context),
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Card(
            elevation: 2,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getStatusWidget(context, task, _bloc),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "${DateFormat("HH:mm").format(task.targetDate)}",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    task.taskTitle,
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  // width: 36,
                  // height: 44,
                  margin: EdgeInsets.only(
                    bottom: 12,
                    top: 12,
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Color(0xFFC4CEF5)),
                  child: Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showEditDialog(context, task, _bloc);
                    },
                  )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  // width: 36,
                  // height: 44,
                  margin: EdgeInsets.only(
                    bottom: 12,
                    top: 12,
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Color(0xFFFB3636)),
                  child: Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDeleteDialog(context, task, _bloc);
                    },
                  )),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getTitle(DateTime dateTime, BuildContext context) {
  final today = DateTime.now();

  if (dateTime.day == today.day && dateTime.month == today.month && dateTime.year == today.year)
    return "Today";
  else if (dateTime.day == today.day + 1 && dateTime.month == today.month && dateTime.year == today.year)
    return "Tomorrow";
  else
    return "${DateFormat("EEE, d-MMM").format(dateTime)}";
}

void showEditDialog(BuildContext context, Task taskData, TodosBloc bloc) {
  final TextEditingController textController = TextEditingController();
  textController.text = taskData.taskTitle;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Edit Task'),
      scrollable: true,
      content: getEditDialogContent(context, taskData, textController),
      actions: [
        FlatButton(
          child: const Text('Cancel'),
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('Save'),
          onPressed: () {
            print(textController.text);
            final dateTime = Provider.of<TaskProvider>(context, listen: false).dateTime;
            bloc.add(UpdateTodo(taskData.copyWith(taskTitle: textController.text, targetDate: dateTime)));
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Widget getEditDialogContent(BuildContext context, Task task, TextEditingController controller) {
  final dateTime = DateTime.now();
  DateTime _dateTime = DateTime.now();
  bool isToday() {
    return dateTime.day == _dateTime.day && dateTime.month == _dateTime.month && dateTime.year == _dateTime.year;
  }

  final taskProvider = Provider.of<TaskProvider>(context);

  _dateTime = taskProvider.dateTime;

  return Container(
    // height: 256,
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          maxLines: 2,
          minLines: 1,
          textInputAction: TextInputAction.done,
          cursorRadius: Radius.circular(1),
          cursorColor: Colors.blue,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 9),
          child: Divider(
            height: 1,
            color: Color(0xFFCFCFCF),
          ),
        ),
        InkWell(
          onTap: () {
            DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              minTime: DateTime(_dateTime.year, _dateTime.month, _dateTime.day),
              onChanged: (date) {
                print('changeDate: $date');
              },
              onConfirm: (date) {
                taskProvider.changeDateTime(date);
              },
              currentTime: task.targetDate,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                isToday()
                    ? "Today, ${_dateTime.hour.toString().padLeft(2, '0')} : ${_dateTime.minute.toString().padLeft(2, '0')}"
                    : "${DateFormat("EEE d MMM").format(_dateTime)}, ${_dateTime.hour.toString().padLeft(2, '0')} : ${_dateTime.minute.toString().padLeft(2, '0')}",
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void showDeleteDialog(BuildContext context, Task task, TodosBloc bloc) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Do you want to delete this task?'),
      scrollable: true,
      actions: [
        FlatButton(
          child: const Text('Cancel'),
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text(
            'Delete',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            bloc.add(DeleteTodo(task));
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

void showStatusChangeDialog(BuildContext context, Task taskData, TodosBloc bloc) {
  int _index = 0;
  changeIndex(int index) {
    _index = index;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Change Status'),
      scrollable: true,
      content: StatusChangeWidget(task: taskData, function: changeIndex),
      actions: [
        FlatButton(
          child: const Text('Cancel'),
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('Save'),
          onPressed: () {
            Status _status;
            int _statusIndex = _index;
            if (_statusIndex == 0) {
              _status = Status.none;
            } else if (_statusIndex == 1) {
              _status = Status.processing;
            } else if (_statusIndex == 2) {
              _status = Status.complete;
            }

            print(_status);
            bloc.add(UpdateTodo(taskData.copyWith(status: EnumToString.convertToString(_status))));
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Widget _getStatusWidget(BuildContext context, Task taskData, TodosBloc bloc) {
  Color _color;
  String _title;
  Status status = EnumToString.fromString(Status.values, taskData.status);

  switch (status) {
    case Status.none:
      _color = statusNewColor;
      _title = "New";
      break;
    case Status.processing:
      _color = statusProcessingColor;
      _title = "Processing";
      break;
    case Status.complete:
      _color = statusCompleteColor;
      _title = "Complete";
      break;
  }

  return GestureDetector(
    onTap: () {
      showStatusChangeDialog(context, taskData, bloc);
    },
    child: Container(
      height: 80.0,
      width: 30.0,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
      ),
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Text(
                _title,
                style: TextStyle(
                  color: statusTextColor,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
