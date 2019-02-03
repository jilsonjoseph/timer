import 'package:flutter/material.dart';
import 'package:timer/timer.dart';
import 'package:timer/timer_controls.dart';
import 'package:timer/timer_dial.dart';
import 'package:timer/timer_time_display.dart';

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Timer timer;
  _MyAppState()
      : timer = Timer(
      maxTime: const Duration(minutes: 35));
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
                TimerDial(
                  currentTime: timer.currentTime,
                  maxTime: timer.maxTime,
                  ticksPerSection: 5,
                ),
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

