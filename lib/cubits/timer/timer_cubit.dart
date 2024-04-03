
import 'package:bloc_multistate/cubits/timer/time_state_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTaskCubit extends Cubit<TimeTaskState> {
  TimeTaskCubit() : super(TimeTaskState.initialValue());


  void addHourMinute({
    required int hour,
    required int minute,
    required String taskName,
  }) {
    emit(state.copyWith(hour: hour, minute: minute-1,targetHour: hour, targetMinute:minute, taskName: taskName));
  }
  Future<void> startTime() async {
    bool isFinished = true;
    while (isFinished) {
      progressValueChanged();
      await Future.delayed(const Duration(seconds: 1), () {
        debugPrint("---------------------------------------hour: ${state.hour}");
        debugPrint("---------------------------------------minute: ${state.minute}");
        debugPrint("---------------------------------------seconde: ${state.second}");
        if (state.hour == 0 && state.minute == 0 && state.second == 0) {
          emit(state.copyWith(finishTime: true));
          isFinished = false;
        } else {
          if (state.second == 0) {
            if (state.minute == 0 && state.hour!=0) {
              emit(state.copyWith(hour: state.hour - 1, minute: 59, second: 59));
            } else {
              emit(state.copyWith(minute: state.minute - 1, second: 59));
            }
          } else {
            emit(state.copyWith(second: state.second - 1));
          }
        }
      });
    }
  }
  void progressValueChanged(){
    emit(state.copyWith(
        progressValue: state.hour == 0
            ? 1 - (state.minute * 60 + state.second) / (state.targetHour * 3600 + state.targetMinute * 60)
            : 1 - (state.hour * 3600 + state.minute * 60 + state.second) / (state.targetHour * 3600 + state.targetMinute * 60)
    ));
  }
  void finishTaskTime(){
    emit(TimeTaskState.initialValue());
  }


}