import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/application/connectivity_awareness_usecases.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/cubits/connectivity_awareness_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityAwarenessCubit
    extends Cubit<ConnectivityAwarenessCubitState> {
  final ConnectivityAwarenessUsecases connectivityAwarenessUsecases;
  ConnectivityAwarenessCubit({required this.connectivityAwarenessUsecases})
      : super(ConnectivityAwarenessCubitInitial());

  void listen() async {
    emit(ConnectivityAwarenessCubitLoadingState());
    connectivityAwarenessUsecases.listen().listen(
      (internetStatus) {
        if (internetStatus == InternetStatus.connected) {
          emit(ConnectivityAwarenessCubitConnectedState());
        } else {
          emit(ConnectivityAwarenessCubitDisconnectedState());
        }
        ;
      },
      onError: (error) {
        emit(ConnectivityAwarenessCubitErrorState(message: error.toString()));
      },
    );
  }

  void onInitStatus() {
    listen();
  }

  void onStopStatus() {
    emit(ConnectivityAwarenessCubitLoadingState());
    connectivityAwarenessUsecases.cancelListening();
    emit(ConnectivityAwarenessCubitInitial());
  }
}
