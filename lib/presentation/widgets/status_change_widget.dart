import 'package:flutter/material.dart';
import 'package:to_do_list/data/database.dart';

import '../../components/styles.dart';

class StatusChangeWidget extends StatefulWidget {
  final Task task;
  final Function function;

  const StatusChangeWidget({Key key, this.task, this.function}) : super(key: key);

  @override
  _StatusChangeWidgetState createState() => _StatusChangeWidgetState();
}

class _StatusChangeWidgetState extends State<StatusChangeWidget> {
  int _index = 0;
  @override
  void initState() {
    super.initState();
    if (widget.task.status == 'none') {
      _index = 0;
    } else if (widget.task.status == 'processing') {
      _index = 1;
    } else if (widget.task.status == 'complete') {
      _index = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _index = 0;
              });
              widget.function(0);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: _index == 0 ? statusNewColor : statusContainerColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'New',
                  style: statusTextStyle.copyWith(
                    color: _index == 0 ? statusTextColor : Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _index = 1;
              });
              widget.function(1);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: _index == 1 ? statusProcessingColor : statusContainerColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Processing',
                  style: statusTextStyle.copyWith(
                    color: _index == 1 ? statusTextColor : Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _index = 2;
              });
              widget.function(2);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: _index == 2 ? statusCompleteColor : statusContainerColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Completed',
                  style: statusTextStyle.copyWith(
                    color: _index == 2 ? statusTextColor : Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
