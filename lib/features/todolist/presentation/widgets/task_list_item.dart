import 'package:flutter/material.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: task.completed
          ? const Icon(Icons.circle_outlined)
          : const Icon(
              Icons.task_alt_rounded,
              color: Colors.blueAccent,
            ),
    );
  }
}
