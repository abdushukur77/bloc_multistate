import 'package:bloc_multistate/screens/timer_screen/time_task_screen/time_task_screen.dart';
import 'package:bloc_multistate/screens/transaction_screen.dart';
import 'package:bloc_multistate/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return TimeTaskScreen();

            }));

          }, child: Text("Timer",style: AppTextStyle.interBold.copyWith(
              fontSize: 24,
              color:Colors.white
          ))),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return BankScreen();

            }));

          }, child: Text("Transaction Screen",style: AppTextStyle.interBold.copyWith(
            fontSize: 24,
            color:Colors.white
          ),)),
        ],),
      ),
    );
  }
}
