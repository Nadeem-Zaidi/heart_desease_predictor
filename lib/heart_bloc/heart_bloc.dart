import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/heart_bloc/heart_event.dart';
import 'package:purple/heart_bloc/heart_state.dart';
import 'package:purple/screens/heart_data/heart_data_helper_widget/heart_class.dart';

class HeartDataBloc extends Bloc<HeartDataEvent, HeartDataState> {
  HeartDataBloc() : super(HeartDataInitialState()) {
    on<HeartDataSendEvent>(_sendHeartJsonData);
    on<HeartDataInitialEvent>(_home);
  }

  Future<void> _sendHeartJsonData(
      HeartDataSendEvent event, Emitter<HeartDataState> emit) async {
    emit(HeartDataLoadingState());
    try {
      var data = await HeartClass.sendHeart(event.dataToSend);
      emit(HeartDataReceiveState(dataReceived: data["result"]));
    } catch (e) {
      emit(
        HeartDataError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _home(
      HeartDataInitialEvent event, Emitter<HeartDataState> emit) async {
    emit(HeartDataInitialState());
  }
}
