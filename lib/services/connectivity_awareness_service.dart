import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityAwarenessService {
  ConnectivityAwarenessService._();

  static final ConnectivityAwarenessService _instance = ConnectivityAwarenessService._();

  factory ConnectivityAwarenessService() => _instance;

  final _connectivity = InternetConnection();

  Stream<InternetStatus> get onStatusChange => _connectivity.onStatusChange;
}