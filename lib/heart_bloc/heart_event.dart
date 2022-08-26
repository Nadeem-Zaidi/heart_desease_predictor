import 'package:equatable/equatable.dart';

abstract class HeartDataEvent extends Equatable {
  const HeartDataEvent();

  @override
  List<Object> get props => [];
}

class HeartDataInitialEvent extends HeartDataEvent {}

class HeartDataSendEvent extends HeartDataEvent {
  String dataToSend;

  HeartDataSendEvent({required this.dataToSend});

  @override
  List<Object> get props => [dataToSend];
}

class HomeForHeartAppEvent extends HeartDataEvent {}
