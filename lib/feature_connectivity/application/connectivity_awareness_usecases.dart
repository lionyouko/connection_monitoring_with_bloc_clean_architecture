import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/domain/repositories/connectivity_awareness_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityAwarenessUsecases {
  final ConnectivityAwarenessRepository connectivityAwarenessRepository;

  ConnectivityAwarenessUsecases(
      {required this.connectivityAwarenessRepository});

  Stream<InternetStatus> listen() async* {
    yield* connectivityAwarenessRepository.listen();
  }

  void cancelListening() {
    connectivityAwarenessRepository.cancelListening();
  }
}
