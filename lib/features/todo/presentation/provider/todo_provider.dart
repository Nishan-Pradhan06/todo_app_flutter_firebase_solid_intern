import 'dart:developer';
import 'package:flutter/material.dart';
import '../../data/model/get_list_model.dart';
import '../../data/repository/todo_repository_impl.dart';
import '../../domain/repository/todo_repository.dart';

class TodoProvider extends ChangeNotifier {
  late TodoRepository _todoRepository;

  List<Todo> _todos = [];
  List<Todo> _completedTodos = [];
  List<Todo> _notCompletedTodos = [];

  bool _isLoading = false;

  TodoProvider() {
    _todoRepository = TodoRepositoryImpl();
    fetchTodos();
  }

  List<Todo> get todos => _todos;
  List<Todo> get completedTodos => _completedTodos;
  List<Todo> get notCompletedTods => _notCompletedTodos;
  bool get isLoading => _isLoading;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _todoRepository.getTodoList();
      _todos = (result['todos'] as List<dynamic>)
          .map((item) => item as Todo)
          .toList();
      await completedTaskList();
      await notCompetedTaskList();
      // log(_todos.toString());
    } catch (e) {
      log(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> completedTaskList() async {
    _completedTodos = todos.where((todo) => todo.completed).toList();
    notifyListeners();
  }

  Future<void> notCompetedTaskList() async {
    _notCompletedTodos = todos.where((todo) => !todo.completed).toList();
  }
}
