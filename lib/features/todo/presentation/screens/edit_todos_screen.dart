import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/widget/custom_button.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/presentation/provider/todos_provider.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../widgets/form_widget.dart';
import '../widgets/label_widget.dart';

class EditTodosScreen extends StatelessWidget {
  const EditTodosScreen({super.key});

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
            LabelWidget(
              text: 'Time',
            ),
            TimePickerWidget(
              onTimeSelected: (time) {
                todosProvider.setTime(time); // Set the selected time
              },
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
    );
  }
}

// Widget for selecting time
class TimePickerWidget extends StatefulWidget {
  final Function(String) onTimeSelected;

  const TimePickerWidget({super.key, required this.onTimeSelected});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        final formattedTime =
            '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')} ${_selectedTime.period.name.toUpperCase()}';
        widget.onTimeSelected(formattedTime); // Pass the formatted time
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectTime(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Select Time',
          border: OutlineInputBorder(),
        ),
        child: Text(
          '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')} ${_selectedTime.period.name.toUpperCase()}',
        ),
      ),
    );
  }
}
