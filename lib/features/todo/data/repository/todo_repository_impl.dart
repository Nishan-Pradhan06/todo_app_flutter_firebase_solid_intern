import 'package:todoo/features/todo/data/services/todo_services.dart';
import 'package:todoo/features/todo/data/services/todo_services_impl.dart';
import 'package:todoo/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  late TodoServices _todoServices;

  TodoRepositoryImpl() {
    _todoServices = TodoServicesImpl();
  }

  @override
  Future<Map<String, List>> getTodoList() {
    return _todoServices.getTodoList();
  }
}
