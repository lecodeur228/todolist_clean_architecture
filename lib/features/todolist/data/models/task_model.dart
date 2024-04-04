import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.title,
    required super.completed,
  });

  factory TaskModel.fromJson({required Map<String, dynamic> json}) {
    return TaskModel(title: json["title"], completed: json["completed"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "completed": completed,
    };
  }
}
