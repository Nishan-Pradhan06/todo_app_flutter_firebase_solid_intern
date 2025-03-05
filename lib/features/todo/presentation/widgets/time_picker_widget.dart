import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todos_provider.dart';

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
