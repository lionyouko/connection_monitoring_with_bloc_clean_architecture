import 'dart:developer';

import 'package:connection_monitoring_with_bloc_clean_architecture/di/service_locator.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/cubits/connectivity_awareness_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityAwarenessWrapperWidget extends StatefulWidget {
  final Widget? child;
  const ConnectivityAwarenessWrapperWidget({super.key, this.child});

  @override
  State<ConnectivityAwarenessWrapperWidget> createState() =>
      _ConnectivityAwarenessWrapperWidgetState();
}

class _ConnectivityAwarenessWrapperWidgetState
    extends State<ConnectivityAwarenessWrapperWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: sl<ConnectivityAwarenessCubit>()..onInitStatus(),
        child: widget.child);
  }

  @override
  void dispose() {
    log('ConnectivityAwarenessWrapperWidget disposed');
    super.dispose();
  }
}
