
import '../model/todos_model.dart';

abstract class TodosServices {
  Future<void> addTask(TodosModel todos);
}
