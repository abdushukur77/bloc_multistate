import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../start_time_screen/start_time_screen.dart';

class TimeTaskScreen extends StatefulWidget {
  const TimeTaskScreen({super.key});

  @override
  State<TimeTaskScreen> createState() => _TimeTaskScreenState();
}

class _TimeTaskScreenState extends State<TimeTaskScreen> {
  TimeOfDay? timeOfDay;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      'Set Your Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    IconButton(
                      onPressed: () async {
                        timeOfDay = await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.input,
                          initialTime: const TimeOfDay(hour: 1, minute: 0),
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.timer,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Time";
                        }
                        return null;
                      },
                      controller: _taskController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Task Name',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Ink(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00696B),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              timeOfDay != null) {
                            if (!context.mounted) return;
                            context.read<TimeTaskCubit>().addHourMinute(
                                hour: timeOfDay!.hour, minute: timeOfDay!.minute,taskName: _taskController.text);
                            debugPrint(
                                "---------------------------hour: ${context.read<TimeTaskCubit>().state.hour}");
                            debugPrint(
                                "---------------------------minute: ${context.read<TimeTaskCubit>().state.minute}");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StartTaskScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Soat va Vazifa nomini kiriting!"),
                            ));
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: const Center(
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}