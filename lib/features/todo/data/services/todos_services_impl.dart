import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/data/services/todos_services.dart';

class TodosServicesImpl implements TodosServices {
  // final FirebaseFirestore _firestore;

  // TodosServicesImpl({FirebaseFirestore? firestore})
  //     : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//create todos
  @override
  Future<void> addTask(TodosModel todos) async {
    await _firestore.collection("todos").add(todos.toJson());
  }

//fetch todos
  @override
  Stream<List<TodosModel>> fetchTodos() {
    return _firestore.collection("todos").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TodosModel.fromJson(
          doc.id,
          doc.data(),
        );
      }).toList();
    });
  }

  //update todos
  @override
  Future<void> updateTodos(TodosModel todos) async {
    await _firestore.collection("todos").doc(todos.id).update(todos.toJson());
  }
}
