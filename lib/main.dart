import 'package:flutter/material.dart';
import 'package:timer/timer_controls.dart';
import 'package:timer/timer_dial.dart';
import 'package:timer/timer_time_display.dart';

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        fontFamily: 'BebasNeue',
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [GRADIENT_TOP,GRADIENT_BOTTOM],
              )
          ),
        child: Center(
          child: Column(
            children: [
              TimerTimeDisplay(),
              TimerDial(),
              Expanded(child: Container()),
              TimerControls(

              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

