import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'clean the room'),
      Todo(id: '2', desc: 'wash the dish'),
      Todo(id: '3', desc: 'clean the room'),

    ]);
  }

  @override
  bool get stringify => true;

  TodoListState copyWith(List<Todo>? todos) {
    return TodoListState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [..._state.todos, newTodo];

    _state = _state.copyWith(newTodos);
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todos.map((Todo todo) {
      if(todo.id == id) {
        return Todo(id: id, desc: todoDesc, completed: todo.completed);
      }
      return todo;
    }).toList();

    _state = _state.copyWith(newTodos);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final newTodos = _state.todos.map((Todo todo) {
      if(todo.id == id) {
        return Todo(id: id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    _state = _state.copyWith(newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    final newTodos = _state.todos.where((t) => todo.id != t.id).toList();

    _state = _state.copyWith(newTodos);
    notifyListeners();
  }
}
















