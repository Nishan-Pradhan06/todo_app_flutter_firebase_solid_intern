import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/widget/custom_button.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/presentation/provider/todos_provider.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../widgets/form_widget.dart';
import '../widgets/label_widget.dart';
import '../widgets/time_picker_widget.dart';

class EditTodosScreen extends StatelessWidget {
  final TodosModel? todos;
  const EditTodosScreen({
    super.key,
    this.todos,
  });

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context, listen: false);

    if (todos != null) {
      todosProvider.titleController.text = todos!.title;
      todosProvider.descriptionController.text = todos!.description;
      todosProvider.selectedTime = todos!.time;
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Todos',
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              LabelWidget(
                text: 'Time',
              ),
              TimePickerWidget(),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                title: 'Update Todos',
                onPressed: () async {
                  // Create a TaskModel object with the selected time
                  final updateTodos = TodosModel(
                    id: todos?.id,
                    title: todosProvider.titleController.text,
                    description: todosProvider.descriptionController.text,
                    time: todosProvider.selectedTime, // Use the selected time
                  );
                  try {
                    await todosProvider.updateTodos(updateTodos);
                    todosProvider.titleController.clear();
                    todosProvider.descriptionController.clear();
                    todosProvider
                        .resetTime(); // Reset the time after task creation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Todos Updated successfully!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to Update Todos: $e')),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                title: 'Delete Todos',
                color: Colors.red[200],
                onPressed: () async {
                  // Create a TaskModel object with the selected time
                  if (todos?.id == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Failed to Delete: Task ID is missing!')),
                    );
                    return;
                  }
                  try {
                    await todosProvider.deleteTodos(todos!.id!);
                    Navigator.pop(context); // Go back to the previous screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Todos Deleted successfully!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to Delete Todos: $e')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
