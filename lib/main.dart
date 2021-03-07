import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/blocs/todos_bloc.dart';
import 'package:to_do_list/domain/todos_repository.dart';

import 'domain/providers/main_provider.dart';
import 'domain/providers/task_provider.dart';
import 'presentation/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
        BlocProvider(
          create: (context) => TodosBloc(
            repository: TodosRepository(),
          ),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(),
      ),
    );
  }
}
