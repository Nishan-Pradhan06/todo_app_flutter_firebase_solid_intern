import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/data/services/todos_services.dart';
import 'package:todo/features/todo/data/services/todos_services_impl.dart';

import '../../domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosServices _todosServices;

  // TodosRepositoryImpl() {
  //   _todosServices = TodosServicesImpl();
  // }
  TodosRepositoryImpl({TodosServices? todosServices})
      : _todosServices = todosServices ?? TodosServicesImpl();

  @override
  Future<void> addTask(TodosModel todos) async {
    await _todosServices.addTask(todos);
  }

  @override
  Stream<List<TodosModel>> fetchTodos()  {
    return _todosServices.fetchTodos();
  }
}
