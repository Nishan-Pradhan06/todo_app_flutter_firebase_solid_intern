import '../model/todos_model.dart';

abstract class TodosServices {
  Future<void> addTask(TodosModel todos); //create todos

  Stream<List<TodosModel>> fetchTodos(); // fetch todos

  Future<void> updateTodos(TodosModel todos);//update todos
}
