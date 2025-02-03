import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/data/datasource/connectivity_awareness_iccp_datasource.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/domain/repositories/connectivity_awareness_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

///
/// iccp (or ICCP) means the third-party package used, in this case: internet_connection_checker_plus
///
class ConnectivityAwarenessIccpRepositoryImpl
    implements ConnectivityAwarenessRepository {
  final ConnectivityAwarenessIccpDatasource connecivityAwarenessIccpDatasource;

  ConnectivityAwarenessIccpRepositoryImpl(
      {required this.connecivityAwarenessIccpDatasource});

  @override
  Stream<InternetStatus> listen() async* {
    yield* connecivityAwarenessIccpDatasource.listen();
  }

  @override
  void cancelListening() {
    connecivityAwarenessIccpDatasource.cancelListening();
  }
}
