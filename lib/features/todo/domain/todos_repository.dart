import '../data/model/todos_model.dart';

abstract class TodosRepository {
  Future<void> addTask(TodosModel todos);
}