import 'todo_repository.dart';
import 'todo_services.dart';
import 'todo_services_impl.dart';

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
