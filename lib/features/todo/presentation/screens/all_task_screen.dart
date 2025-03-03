import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/features/todo/presentation/provider/todo_provider.dart';
import '../widgets/todo_box_widget.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        if (todoProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (todoProvider.todos.isEmpty) {
          return Center(child: Text('No tasks available.'));
        }
        return ListView.builder(
          itemCount: 10, // The length of the list
          itemBuilder: (context, index) {
            final todo = todoProvider.todos[index];
            return TodoWidget(
              title: todo.title,
              description: todo.completed ? 'Completed' : 'Not Completed',
            );
          },
        );
      },
    );
  }
}
