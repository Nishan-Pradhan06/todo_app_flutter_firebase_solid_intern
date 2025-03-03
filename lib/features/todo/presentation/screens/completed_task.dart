import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/features/todo/presentation/provider/todo_provider.dart';

import '../widgets/todo_box_widget.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (context, completedTodo, child) {
          if (completedTodo.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (completedTodo.todos.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
            itemCount: 3, // The length of the list
            itemBuilder: (context, index) {
              final todo = completedTodo.completedTodos[index];
              return TodoWidget(
                title: todo.title,
                description: 'Completed',
                // todo.completed,
              );
            },
          );
        },
      ),
    );
  }
}
