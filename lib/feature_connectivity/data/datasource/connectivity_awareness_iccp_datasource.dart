import 'dart:async';
import 'dart:developer';

import 'package:connection_monitoring_with_bloc_clean_architecture/services/connectivity_awareness_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectivityAwarenessIccpDatasource {
  Stream<InternetStatus> listen();
  void cancelListening();
}

class ConnectivityAwarenessIccpDatasourceImpl
    implements ConnectivityAwarenessIccpDatasource {
  final ConnectivityAwarenessService connectivityAwarenessService;
  StreamSubscription<InternetStatus>? _subscription;
  final StreamController<InternetStatus> _controller =
      StreamController<InternetStatus>();

  ConnectivityAwarenessIccpDatasourceImpl(
      {required this.connectivityAwarenessService}) {
    startListening();
  }

  @override
  Stream<InternetStatus> listen() {
    return _controller.stream;
  }

  void startListening() {
    _subscription?.cancel();
    _subscription =
        connectivityAwarenessService.onStatusChange.listen((internetStatus) {
      _controller.add(internetStatus);
    }, onError: (error) {
      log('Connectivity Awareness Feature: Stream error: $error');
    });
  }

  void _stopListening() async {
    await _subscription?.cancel();
    await _controller.close();
    log('Connectivity Awareness Feature: Stream closed');
  }

  @override
  void cancelListening() {
    _stopListening();
  }
}
