import '../../domain/repository/todo_repository.dart';
import '../services/todo_services.dart';
import '../services/todo_services_impl.dart';

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
