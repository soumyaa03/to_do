import 'package:flutter/material.dart';
import 'package:to_do/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
//where((todo) => todo.isDone == false).
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool TodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
