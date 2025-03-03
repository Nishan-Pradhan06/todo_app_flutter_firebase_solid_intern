import 'package:flutter/material.dart';
import '../../../../core/widget/custom_appbar.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Task',
      ),
      body: Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
