import 'package:flutter/material.dart';
import 'package:todo/features/todo/domain/repository/todos_repository.dart';
import '../../data/model/todos_model.dart';

class TodosProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedTime = ''; // Field to store the selected time
  bool _isCompleted = false; // Private field for completion status

  // Getter for isCompleted
  bool get isCompleted => _isCompleted;

  // Method to toggle isCompleted
  void toggleIsCompleted() {
    _isCompleted = !_isCompleted; // Toggle the value
    notifyListeners(); // Notify listeners of the change
  }

  final TodosRepository _todosRepository;

  TodosProvider({required TodosRepository todosRepository})
      : _todosRepository = todosRepository;

  // Create todos
  Future<void> createTask(TodosModel todos) async {
    try {
      await _todosRepository.addTask(todos);
      notifyListeners(); // Notify listeners if needed
    } catch (e) {
      debugPrint("Failed to add task: $e");
      rethrow;
    }
  }

  // Fetch todos
  Stream<List<TodosModel>>? _todosStream;
  Stream<List<TodosModel>>? get todosStream => _todosStream;

  // Fetch all tasks from Firebase
  void fetchTodos() async {
    _todosStream = _todosRepository.fetchTodos();
    notifyListeners();
  }

  // Update todos
  Future<void> updateTodos(TodosModel todos) async {
    if (todos.id == null) {
      throw Exception("Task ID is required for updates.");
    }
    await _todosRepository.updateTodos(todos);
    notifyListeners();
  }

  // Delete todos
  Future<void> deleteTodos(String todosId) async {
    if (todosId.isEmpty) {
      throw Exception("Task ID is required for deletion.");
    }
    await _todosRepository.deleteTodos(todosId);
  }

  // Time picker logic
  void setTime(String time) {
    selectedTime = time; // Set the selected time
    notifyListeners();
  }

  void resetTime() {
    selectedTime = ''; // Reset the time
    notifyListeners();
  }

  // Pick time
  Future<void> timePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final formattedTime = _formatTime(picked);
      setTime(formattedTime); // Update the selected time
    }
  }

  // Helper method to format time in 12-hour format
  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
