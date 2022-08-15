import 'package:equatable/equatable.dart';
import '../models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({
    required this.filter
  });

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  bool get stringify => true;

  TodoFilterState copyWith(Filter? filter) {
    return TodoFilterState(filter: filter ?? this.filter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filter];
}

class TodoFilter with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(newFilter);
    notifyListeners();
  }
}





















