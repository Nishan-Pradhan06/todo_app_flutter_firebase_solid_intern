import '../../data/model/todos_model.dart';

abstract class TodosRepository {
  Future<void> addTask(TodosModel todos); //create todos

  Stream<List<TodosModel>> fetchTodos(); // fetch todos

  Future<void> updateTodos(TodosModel todos); //update todos

  Future<void> deleteTodos(String todosId); //delete todos
}
