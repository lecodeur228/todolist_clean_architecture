import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_clean_architecture/core/connection/network_info.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';
import 'package:todolist_clean_architecture/core/params/params.dart';
import 'package:todolist_clean_architecture/features/todolist/data/datasources/local/task_local_datasource.dart';
import 'package:todolist_clean_architecture/features/todolist/data/datasources/remote/task_remote_datasource.dart';
import 'package:todolist_clean_architecture/features/todolist/data/services/task_service.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/entities/task.dart';
import 'package:todolist_clean_architecture/features/todolist/domain/usecases/get_tasks.dart';

class TaskProvider extends ChangeNotifier {
  List<Task>? tasks;
  Failure? failure;

  TaskProvider({this.tasks, this.failure});

  void eitherFailureOrTasks() async {
    TaskService service = TaskService(
        localDataSource: TaskLocalDataSource(
            sharedPreferences: await SharedPreferences.getInstance()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSource: TaskRemoteDataSource());

    final failureOrTasks = await GetTasks(service).call(NoParams());

    failureOrTasks.fold((newFailure) {
      tasks = null;
      failure = newFailure;
      notifyListeners();
    }, (newTask) {
      tasks = newTask;
      failure = null;
      notifyListeners();
    });
  }
}
