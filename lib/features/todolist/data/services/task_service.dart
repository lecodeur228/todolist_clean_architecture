import 'package:dartz/dartz.dart';
import 'package:todolist_clean_architecture/core/connection/network_info.dart';
import 'package:todolist_clean_architecture/core/error/exceptions.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';
import 'package:todolist_clean_architecture/features/todolist/data/datasources/local/task_local_datasource.dart';
import 'package:todolist_clean_architecture/features/todolist/data/datasources/remote/task_remote_datasource.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart'
    as task;
import 'package:todolist_clean_architecture/features/todolist/domain/repositories/task_repository.dart';

class TaskService implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TaskService(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<task.Task>>> getTasks() async {
    if (await networkInfo.isConnect!) {
      try {
        final remoteTasks = await remoteDataSource.getTasks();
        localDataSource.cacheTasks(remoteTasks);
        return right(remoteTasks);
      } on ServerException {
        return left(ServerFailure(errorMessage: "This is a server exception"));
      }
    } else {
      try {
        final tasks = await localDataSource.getCacheTasks();
      return Right(tasks);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }

    }
  }
}
