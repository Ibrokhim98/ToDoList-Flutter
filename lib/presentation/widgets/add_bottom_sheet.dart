import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/domain/blocs/todos_bloc.dart';
import 'package:to_do_list/components/enums.dart';

import '../../components/styles.dart';

const bottomSheetHeight = 360.0;
const bottomSheetCornerRadius = 12.0;

class AddBottomSheet extends StatefulWidget {
  @override
  _AddBottomSheetState createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final dateTime = DateTime.now();
  DateTime _dateTime = DateTime.now();

  TodosBloc _todosBloc;

  @override
  void initState() {
    super.initState();
    _todosBloc = BlocProvider.of<TodosBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isToday() {
      return dateTime.day == _dateTime.day && dateTime.month == _dateTime.month && dateTime.year == _dateTime.year;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      height: bottomSheetHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomSheetCornerRadius),
          topRight: Radius.circular(bottomSheetCornerRadius),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "Add New Task",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          TextField(
              controller: _controller,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
              maxLines: 3,
              minLines: 1,
              keyboardType: TextInputType.text),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Data:',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(dateTime.year, dateTime.month, dateTime.day),
                    onChanged: (date) {
                      print('changeDate: $date');
                    },
                    onConfirm: (date) {
                      setState(() {
                        _dateTime = date;
                      });
                    },
                    currentTime: DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute),
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
                    SizedBox(
                      width: 16,
                    ),
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
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: FlatButton(
              onPressed: () {
                _todosBloc.add(AddTodo(_controller.text, _dateTime, EnumToString.convertToString(Status.none)));
                print(_todosBloc.state.toString());
                Navigator.pop(context);
              },
              child: Container(
                height: 46.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
