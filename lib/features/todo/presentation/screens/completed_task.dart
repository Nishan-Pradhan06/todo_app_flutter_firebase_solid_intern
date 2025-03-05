import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/presentation/provider/todos_provider.dart';
import '../widgets/todos_widget.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context, listen: false);

    return Scaffold(
      body: StreamBuilder<List<TodosModel>>(
        stream: todosProvider.todosStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final todos = snapshot.data;
          if (todos == null || todos.isEmpty) {
            return const Center(child: Text('No completed tasks available.'));
          }

          // Filter completed todos
          final completedTodos =
              todos.where((todo) => todo.isCompleted).toList();

          if (completedTodos.isEmpty) {
            return const Center(child: Text('No completed tasks available.'));
          }

          return ListView.builder(
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              final todo = completedTodos[index];
              return TodosWidget(
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
                    await todosProvider.updateTodos(updatedTodo);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update task: $e')),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
