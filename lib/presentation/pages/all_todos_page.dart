import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/components/enums.dart';
import 'package:to_do_list/presentation/widgets/bottom_menu_item.dart';
import 'package:to_do_list/presentation/widgets/tasks_list.dart';

import '../widgets/add_bottom_sheet.dart';

class AllTodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              _modalBottomSheetMenu(context);
            },
            child: Text(
              '+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
          ),
        ],
        title: Text(
          menuItemName(BottomMenu.menu_all, context),
        ),
      ),
      body: TasksList(page: Pages.all),
    );
  }
}

void _modalBottomSheetMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(bottomSheetCornerRadius),
    ),
    builder: (builder) => AddBottomSheet(),
  );
}
