import 'package:flutter/material.dart';
import 'package:todo/features/todo/domain/todos_repository.dart';
import '../../data/model/todos_model.dart';

class TodosProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TodosRepository _todosRepository;

  // TodosProvider(TodosModel todos) {
  //   _todosRepository = TodosRepositoryImpl();
  //   createTask(todos);
  // }

  // Future<void> createTask(TodosModel todos) async {
  //   await _todosRepository.addTask(todos);
  // }

  TodosProvider({required TodosRepository todosRepository})
      : _todosRepository = todosRepository;

  Future<void> createTask(TodosModel todos) async {
    try {
      await _todosRepository.addTask(todos);
      notifyListeners(); // Notify listeners if needed
    } catch (e) {
      debugPrint("Failed to add task: $e");
      rethrow;
    }
  }
}
