import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/widget/custom_button.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/presentation/provider/todos_provider.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../widgets/form_widget.dart';
import '../widgets/label_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Task',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelWidget(
              text: 'Title',
            ),
            CustomFormFieldWidget(
              label: 'title',
              controller: todosProvider.titleController,
            ),
            LabelWidget(
              text: 'Description',
            ),
            CustomFormFieldWidget(
              label: 'Descriptions',
              vertical: 40,
              controller: todosProvider.descriptionController,
            ),
            CustomButton(
              title: 'Create Task',
              onPressed: () async {
                // Create a TaskModel object
                final task = TodosModel(
                  title: todosProvider.titleController.text,
                  description: todosProvider.descriptionController.text,
                );
                try {
                  await todosProvider.createTask(task);
                  todosProvider.titleController.clear();
                  todosProvider.descriptionController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Task created successfully!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create task: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
