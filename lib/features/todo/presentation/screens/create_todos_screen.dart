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
                title: 'Create Task',
                onPressed: () async {
                  // Create a TaskModel object with the selected time
                  final task = TodosModel(
                    title: todosProvider.titleController.text,
                    description: todosProvider.descriptionController.text,
                    time: todosProvider.selectedTime, // Use the selected time
                  );
                  try {
                    await todosProvider.createTask(task);
                    todosProvider.titleController.clear();
                    todosProvider.descriptionController.clear();
                    todosProvider
                        .resetTime(); // Reset the time after task creation
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
      ),
    );
  }
}

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context);

    return InkWell(
      onTap: () => todosProvider.timePicker(context),
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: 'Select Time',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: Text(
          todosProvider.selectedTime.isEmpty
              ? 'Select Time'
              : todosProvider.selectedTime,
        ),
      ),
    );
  }
}
