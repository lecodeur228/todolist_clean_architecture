import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart';
import 'package:todolist_clean_architecture/features/todolist/presentation/providers/task_provider.dart';
import 'package:todolist_clean_architecture/features/todolist/presentation/widgets/task_list_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task>? tasks = Provider.of<TaskProvider>(context).tasks;
    Failure? failures = Provider.of<TaskProvider>(context).failure;
    late Widget widget;

    if (tasks != null) {
      widget = ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey.shade300); // Ligne de séparation
        },
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskListItem(
            task: tasks[index],
          );
        },
      );
    } else if (failures != null) {
      widget = Center(
        child: Text(failures.errorMessage),
      );
    } else {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Listes des tâches"),
      ),
      body: widget,
    );
  }
}
