import 'package:dartz/dartz.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';
import 'package:todolist_clean_architecture/core/params/params.dart';
import 'package:todolist_clean_architecture/core/usecases/usecase.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart'
    as task;
import 'package:todolist_clean_architecture/features/todolist/domain/repositories/task_repository.dart';

class GetTasks implements UseCase<List<task.Task>, NoParams> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<Either<Failure, List<task.Task>>> call(NoParams params) async {
    return await repository.getTasks();
  }
}
