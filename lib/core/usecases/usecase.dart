import 'package:dartz/dartz.dart';
import 'package:todolist_clean_architecture/core/error/failure.dart';

abstract class UseCase<Type, Params> {

  Future<Either<Failure, Type>> call(Params params);

}
