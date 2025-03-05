import 'package:flutter/material.dart';
import 'package:todo/features/todo/domain/repository/todos_repository.dart';
import '../../data/model/todos_model.dart';

class TodosProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedTime = ''; // Field to store the selected time

  final TodosRepository _todosRepository;

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

  void setTime(String time) {
    selectedTime = time; // Set the selected time
    notifyListeners();
  }

  void resetTime() {
    selectedTime = ''; // Reset the time
    notifyListeners();
  }

  Stream<List<TodosModel>>? _todosStream;

  // Fetch all tasks from Firebase
  void fetchTodos() async {
    _todosStream = _todosRepository.fetchTodos();
    notifyListeners();
  }

  Stream<List<TodosModel>>? get todosStream => _todosStream;

  // Time picker logic
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
