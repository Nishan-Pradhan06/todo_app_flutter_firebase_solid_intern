// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../widgets/todo_box_widget.dart';

// class NotCompletedTask extends StatelessWidget {
//   const NotCompletedTask({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<TodoProvider>(
//         builder: (context, nonCompletedTodos, child) {
//           return ListView.builder(
//             itemCount: 10, // The length of the list
//             itemBuilder: (context, index) {
//               final todo = nonCompletedTodos.notCompletedTods[index];
//               return TodoWidget(
//                 title: todo.title,
//                 description: 'Not Completed',
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
