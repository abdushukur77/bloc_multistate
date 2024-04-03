import 'package:bloc_multistate/cubits/bank/data_cubit.dart';
import 'package:bloc_multistate/screens/helper_scr.dart';
import 'package:bloc_multistate/screens/timer_screen/time_task_screen/time_task_screen.dart';
import 'package:bloc_multistate/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/timer/timer_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TimeTaskCubit()),
        BlocProvider(create: (_) => BankCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF000000),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF000000),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.light))),
        home: const HelperScreen());
  }
}
