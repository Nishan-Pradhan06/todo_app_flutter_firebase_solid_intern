import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/todos_widget.dart';

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