import 'package:dio/dio.dart';
import '../../../../core/constant/api.dart';
import '/features/todo/data/services/todo_services.dart';
import '../model/get_list_model.dart';

class TodoServicesImpl implements TodoServices {
  final Dio _dio = Dio();

  List<Todo> todosList = [];

  @override
  Future<Map<String, List>> getTodoList() async {
    final response = await _dio.get('$BASE_API/todos');

    // If the request is successful
    if (response.statusCode == 200) {
      // Ensure the response data is a List<dynamic> and cast it to List<Todo>
      todosList =
          (response.data as List).map((todo) => Todo.fromJson(todo)).toList();

      // Returning a map with the list of todos
      return {"todos": todosList};
    } else {
      // Handle error
      throw Exception('Failed to load todos');
    }
  }
}
