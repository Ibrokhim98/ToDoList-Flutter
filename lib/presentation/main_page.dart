import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/providers/main_provider.dart';
import 'package:to_do_list/presentation/pages/all_todos_page.dart';
import 'package:to_do_list/presentation/pages/done_todos_page.dart';
import 'package:to_do_list/presentation/pages/processing_todos_page.dart';

import 'widgets/bottom_navbar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    bool isChange = false;

    return Scaffold(
      body: IndexedStack(
        children: [
          AllTodosPage(),
          ProcessingTodosPage(),
          DoneTodosPage(),
        ],
        index: mainProvider.index,
      ),
      bottomNavigationBar: BottomNavBar(
        mainProvider: mainProvider,
        baseContext: context,
      ),
    );
  }
}
