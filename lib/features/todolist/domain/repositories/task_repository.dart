import 'package:dartz/dartz.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart' as task;

abstract class TaskRepository {
  Future<Either<Failure, List<task.Task>>> getTasks();
}
