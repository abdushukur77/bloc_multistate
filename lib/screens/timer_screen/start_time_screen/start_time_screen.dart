import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';
import '../../../cubits/timer/time_state_cubit.dart';
import '../../../cubits/timer/timer_cubit.dart';
import '../time_task_screen/time_task_screen.dart';

class StartTaskScreen extends StatefulWidget {
  const StartTaskScreen({super.key});

  @override
  State<StartTaskScreen> createState() => _StartTaskScreenState();
}

class _StartTaskScreenState extends State<StartTaskScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<TimeTaskCubit>().startTime();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isWakelockEnabled = false;

    void toggleWakelock() {
      if (isWakelockEnabled) {
        Wakelock.disable();
      } else {
        Wakelock.enable();
      }

      setState(() {
        isWakelockEnabled = !isWakelockEnabled;
      });
    }

    return Scaffold(
        body: BlocBuilder<TimeTaskCubit, TimeTaskState>(
          builder: (BuildContext context, TimeTaskState state) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.taskName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Stack(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 250,
                          child: CircularProgressIndicator(
                            value: state.progressValue,
                            color: const Color(0xFF00696B),
                            backgroundColor: Colors.blueGrey,
                            strokeWidth: 8,
                          ),


                        ),
                        Positioned(
                          right: 30,
                          bottom: 125,
                          child: RichText(
                            text: TextSpan(
                                text: state.hour
                                    .toString()
                                    .length == 1
                                    ? "0${state.hour.toString()}"
                                    : state.hour.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40
                                ),
                                children: [
                                  TextSpan(
                                      text: state.minute
                                          .toString()
                                          .length == 1 ? " : 0${state.minute
                                          .toString()} : " : " : ${state.minute
                                          .toString()} : ",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40
                                      )
                                  ),
                                  TextSpan(
                                      text: state.second
                                          .toString()
                                          .length == 1 ? "0${state.second
                                          .toString()}" : state.second
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40
                                      )
                                  ),
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                    if(state.finishTime)
                      ScaffoldMessenger(
                        child: AlertDialog(
                          title: const Text('Vazifa tugadi'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<TimeTaskCubit>().finishTaskTime();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TimeTaskScreen()),
                                );


                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      )

                  ]
              ),
            );
          },
        )
    );
  }
}