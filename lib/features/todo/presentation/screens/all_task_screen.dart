import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/presentation/provider/todos_provider.dart';
import '../widgets/todos_widget.dart';
import 'edit_todos_screen.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context, listen: false);

    // Fetch todos when the screen loads
    WidgetsBinding.instance
        .addPostFrameCallback((_) => todosProvider.fetchTodos());

    return Scaffold(
      body: StreamBuilder<List<TodosModel>>(
        stream: todosProvider.todosStream,
        builder: (context, snapshot) {
          // Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle errors
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Check if data is available
          final todos = snapshot.data;
          if (todos == null || todos.isEmpty) {
            return const Center(child: Text('No tasks available.'));
          }

          // Display the list of todos
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditTodosScreen(
                        todos: todo,
                      ),
                    ),
                  );
                },
                child: TodosWidget(
                  title: todo.title,
                  description: todo.description,
                  time: todo.time,
                  isCompleted: todo.isCompleted,
                  onToggle: (bool? value) async {
                    // Toggle the completion status in Firestore
                    final updatedTodo = TodosModel(
                      id: todo.id,
                      title: todo.title,
                      description: todo.description,
                      time: todo.time,
                      isCompleted: value ?? false, // Update the status
                    );
                    try {
                      await todosProvider
                          .updateTodos(updatedTodo); // Update in Firestore

                      // Show SnackBar with dynamic message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value == true
                                ? 'Marked as Completed'
                                : 'Marked as Incomplete',
                          ),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to update task: $e')),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
