import 'package:equatable/equatable.dart';
import 'package:purple/screens/heart_data/heart_data.dart';

abstract class HeartDataState extends Equatable {
  const HeartDataState();

  @override
  List<Object> get props => [];
}

class HeartDataInitialState extends HeartDataState {}

class HeartDataLoadingState extends HeartDataState {}

class HeartDataReceiveState extends HeartDataState {
  String dataReceived;

  HeartDataReceiveState({required this.dataReceived});

  @override
  List<Object> get props => [dataReceived];
}

class HeartDataError extends HeartDataState {
  final String error;

  const HeartDataError({required this.error});

  @override
  List<Object> get props => [error];
}

class HomeForHeartApp extends HeartDataState {}
