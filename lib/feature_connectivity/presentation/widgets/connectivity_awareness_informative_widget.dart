import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/cubits/connectivity_awareness_cubit.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/cubits/connectivity_awareness_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityAwarenessInformativeWidget extends StatelessWidget {
  const ConnectivityAwarenessInformativeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityAwarenessCubit,
        ConnectivityAwarenessCubitState>(builder: (context, state) {
      if (state is ConnectivityAwarenessCubitConnectedState) {
        return const Icon(
          Icons.wifi,
          color: Colors.green,
          size: 150,
        );
      } else if (state is ConnectivityAwarenessCubitDisconnectedState) {
        return const Icon(
          Icons.wifi_off,
          color: Colors.red,
          size: 150,
        );
      } else {
        return const Icon(
          Icons.wifi,
          color: Colors.grey,
          size: 150,
        );
      }
    });
  }
}
