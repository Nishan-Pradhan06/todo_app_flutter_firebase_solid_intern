import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/data/services/todos_services.dart';
import 'package:todo/features/todo/data/services/todos_services_impl.dart';

import '../../domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosServices _todosServices;

  // TodosRepositoryImpl() {
  //   _todosServices = TodosServicesImpl();
  // }
  //constructure
  TodosRepositoryImpl({TodosServices? todosServices})
      : _todosServices = todosServices ?? TodosServicesImpl();

//create todos
  @override
  Future<void> addTask(TodosModel todos) async {
    await _todosServices.addTask(todos);
  }

//fetch todos
  @override
  Stream<List<TodosModel>> fetchTodos() {
    return _todosServices.fetchTodos();
  }

  //update todos
  @override
  Future<void> updateTodos(TodosModel todos) async {
    await _todosServices.updateTodos(todos);
  }

  //delete todos
  @override
  Future<void> deleteTodos(String todosId) async {
    await _todosServices.deleteTodos(todosId);
  }
}
