import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/application/connectivity_awareness_usecases.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/data/datasource/connectivity_awareness_iccp_datasource.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/data/repositories/connectivity_awareness_iccp_repository_impl.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/domain/repositories/connectivity_awareness_repository.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/cubits/connectivity_awareness_cubit_state.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/services/connectivity_awareness_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
  await _initConnectivityAwarenessFeature();
}

Future<void> _initConnectivityAwarenessFeature() async {
  // presentation layer
  sl.registerFactory<ConnectivityAwarenessCubit>(
      () => ConnectivityAwarenessCubit(connectivityAwarenessUsecases: sl()));
  // application layer
  sl.registerFactory<ConnectivityAwarenessUsecases>(() =>
      ConnectivityAwarenessUsecases(connectivityAwarenessRepository: sl()));
  // data layer
  sl.registerFactory<ConnectivityAwarenessRepository>(() =>
      ConnectivityAwarenessIccpRepositoryImpl(
          connecivityAwarenessIccpDatasource: sl()));
  sl.registerFactory<ConnectivityAwarenessIccpDatasource>(() =>
      ConnectivityAwarenessIccpDatasourceImpl(
          connectivityAwarenessService: sl()));

  // external layer
  sl.registerFactory<ConnectivityAwarenessService>(
      () => ConnectivityAwarenessService());
}
