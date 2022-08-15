import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mngm/pages/todos_page.dart';
import 'package:state_mngm/providers/active_todo_count.dart';
import 'package:state_mngm/providers/filtered_todos.dart';
import 'package:state_mngm/providers/todo_filter.dart';
import 'package:state_mngm/providers/todo_list.dart';
import 'package:state_mngm/providers/todo_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter()
        ),
        ChangeNotifierProvider<TodoSearch>(
            create: (context) => TodoSearch()
        ),
        ChangeNotifierProvider<TodoList>(
            create: (context) => TodoList()
        ),
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(
          create: (context) => ActiveTodoCount(
            initialActiveTodoCount: context.read<TodoList>().state.todos.length
          ),
          update: (context, todoList, activeTodoCount) => activeTodoCount!..update(todoList)
        ),
        ChangeNotifierProxyProvider3<TodoFilter, TodoSearch, TodoList, FilteredTodos>(
          create: (context) => FilteredTodos(
            initialFilteredTodos: context.read<TodoList>().state.todos
          ),
          update: (context, todoFilter, todoSearch, todoList, filteredTodos) => filteredTodos!..update(todoFilter, todoSearch, todoList)
        )
      ],
      child: MaterialApp(
        title: 'todos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: TodosPage()
      ),
    );
  }
}







































