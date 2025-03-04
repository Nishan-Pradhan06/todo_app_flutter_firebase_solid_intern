import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home_screens.dart';

class AllTodosScreen extends StatefulWidget {
  const AllTodosScreen({super.key});

  @override
  State<AllTodosScreen> createState() => _AllTodosScreenState();
}

class _AllTodosScreenState extends State<AllTodosScreen> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("todos").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> todosDocs =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return TodosWidget(
                title: todosDocs["title"],
                description: todosDocs["description"],
                time: '10PM',
              );
            },
          );
        },
      ),
    );
  }
}
// class AllTodosScreen extends StatelessWidget {
//   const AllTodosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TodoProvider>(
//       builder: (context, todoProvider, child) {
//         if (todoProvider.isLoading) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (todoProvider.todos.isEmpty) {
//           return Center(child: Text('No tasks available.'));
//         }
//         return ListView.builder(
//           itemCount: 10, // The length of the list
//           itemBuilder: (context, index) {
//             final todo = todoProvider.todos[index];
//             return TodoWidget(
//               title: todo.title,
//               description: todo.completed ? 'Completed' : 'Not Completed',
//             );
//           },
//         );
//       },
//     );
//   }
// }
