import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectivityAwarenessRepository {
  Stream<InternetStatus> listen();
  void cancelListening(); 

}