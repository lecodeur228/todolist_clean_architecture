import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_clean_architecture/features/todolist/data/models/task_model.dart';

class TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSource({required this.sharedPreferences});

  // méthode pour save les task en locale
  Future<void> cacheTasks(List<TaskModel> tasks) async {
    final jsonList = tasks.map((task) => jsonEncode(task.toJson())).toList();

    await sharedPreferences.setStringList("tasks", jsonList);
  }

  // metode  pour récuperer les tasks
  Future<List<TaskModel>> getCacheTasks() async {
    final jsonStringList = sharedPreferences.getStringList("tasks") ?? [];
    final jsonList = jsonStringList
        .map((jsonString) => TaskModel.fromJson(json: jsonDecode(jsonString)))
        .toList();

    return jsonList.cast<TaskModel>();
  }
}
