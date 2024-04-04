import 'package:data_connection_checker_tv/data_connection_checker.dart';

// class qui contient une methode abstract
abstract class NetworkInfo {
  Future<bool>? get isConnect;
}

// class qui implement la class abstract et modifier la methode abstract
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnect => connectionChecker.hasConnection;
}
