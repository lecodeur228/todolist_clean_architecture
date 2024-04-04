import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist_clean_architecture/core/constants/constants.dart';
import 'package:todolist_clean_architecture/core/error/exceptions.dart';
import 'package:todolist_clean_architecture/features/todolist/data/models/task_model.dart';


class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(Uri.parse(host));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<TaskModel> tasks = jsonList.map((taskJson) => TaskModel.fromJson(json: taskJson)).toList();
      return tasks;
    } else {
      throw ServerException();
    }
  }
}
