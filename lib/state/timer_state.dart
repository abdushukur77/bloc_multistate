import 'package:equatable/equatable.dart';

enum TimerStatus { initial, running, paused, completed }

class TimerState extends Equatable {
  final Duration duration;
  final TimerStatus status;

  const TimerState(this.duration, this.status);

  @override
  List<Object?> get props => [duration, status];
}
