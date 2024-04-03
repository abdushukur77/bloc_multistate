class TimeTaskState {
  final String taskName;
  final int hour;
  final int minute;
  final double progressValue;
  final int second;
  final int targetHour;
  final int targetMinute;
  final bool finishTime;

  TimeTaskState({
    required this.taskName,
    required this.hour,
    required this.progressValue,
    required this.minute,
    required this.second,
    required this.targetHour,
    required this.targetMinute,
    required this.finishTime,
  });

  TimeTaskState copyWith({
    String? taskName,
    int? hour,
    int? minute,
    int? second,
    int? targetHour,
    double? progressValue,
    int? targetMinute,
    bool? finishTime,
  }) =>
      TimeTaskState(
        taskName: taskName ?? this.taskName,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        second: second ?? this.second,
        targetHour: targetHour?? this.targetHour,
        targetMinute: targetMinute?? this.targetMinute,
        finishTime: finishTime?? this.finishTime,
        progressValue: progressValue ?? this.progressValue,
      );

  static TimeTaskState initialValue() => TimeTaskState(progressValue: 0.0,taskName: '',hour: 0, minute: 0, second: 59,targetHour: 0,targetMinute: 0, finishTime: false);
}