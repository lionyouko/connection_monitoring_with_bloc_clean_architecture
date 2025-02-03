
import 'package:equatable/equatable.dart';

sealed class ConnectivityAwarenessCubitState extends Equatable{
  const ConnectivityAwarenessCubitState();

  @override
  List<Object> get props => [];
}

class ConnectivityAwarenessCubitInitial extends ConnectivityAwarenessCubitState {
  @override
  List<Object> get props => [];
}

class ConnectivityAwarenessCubitLoadingState extends ConnectivityAwarenessCubitState {
  @override
  List<Object> get props => [];
}

class ConnectivityAwarenessCubitConnectedState extends ConnectivityAwarenessCubitState {
  @override
  List<Object> get props => [];
}

class ConnectivityAwarenessCubitDisconnectedState extends ConnectivityAwarenessCubitState {
  @override
  List<Object> get props => [];
}

class ConnectivityAwarenessCubitErrorState extends ConnectivityAwarenessCubitState {
  final String message;

  ConnectivityAwarenessCubitErrorState({required this.message});

  @override
  List<Object> get props => [message];
}