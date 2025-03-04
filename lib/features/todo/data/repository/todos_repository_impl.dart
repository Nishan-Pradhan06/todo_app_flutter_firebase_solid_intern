import 'package:todo/features/todo/data/model/todos_model.dart';
import 'package:todo/features/todo/data/services/todos_services.dart';
import 'package:todo/features/todo/data/services/todos_services_impl.dart';

import '../../domain/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  late TodosServices _todosServices;

  TodosRepositoryImpl() {
    _todosServices = TodosServicesImpl();
  }

  @override
  Future<void> addTask(TodosModel todos) async {
    await _todosServices.addTask(todos);
  }
}
