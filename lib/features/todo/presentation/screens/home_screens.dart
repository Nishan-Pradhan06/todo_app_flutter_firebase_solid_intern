import 'package:flutter/material.dart';
import 'package:todoo/core/widget/custom_appbar.dart';
import 'package:todoo/features/todo/presentation/screens/completed_task.dart';
import 'add_task_screen.dart';
import 'all_task_screen.dart';
import 'not_compelted_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Todo List App Huncha Digital',
          bottom: const TabBar(
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white60,
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Not Completed'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllTaskScreen(),
            NotCompletedTask(),
            CompletedTask(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
