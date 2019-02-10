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

   Timer timer;
  _MyAppState(){
    timer = Timer(
        maxTime: const Duration(minutes: 35),
    onTimerUpdate: _onTimerUpdate,
    );
  }

  _onTimeSelected(Duration newTime){
    setState(() {
      timer.currentTime = newTime;
    });

  }

  _onDialStopTurning(Duration newTime) {
    setState((){
      timer.currentTime = newTime;
      timer.resume();
    });
  }

  _onTimerUpdate(){
      setState(() {

      });
  }


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
                TimerTimeDisplay(
                  timerState: timer.state,
                  selectionTime: timer.lastStartTime,
                  countdownTime: timer.currentTime,
                ),
                TimerDial(
                  timerState: timer.state,
                  currentTime: timer.currentTime,
                  maxTime: timer.maxTime,
                  ticksPerSection: 5,
                  onTimeSelected: _onTimeSelected,
                  onDialStopTurning: _onDialStopTurning,
                ),
                Expanded(child: Container()),
                TimerControls(
                  timerState: timer.state,
                  onPause: (){
                    setState(() => timer.pause());
                  },
                  onResume: (){
                    setState(() => timer.resume());
                  },
                  onRestart: (){
                    setState(() => timer.restart());
                  },
                  onReset: (){
                    setState(() => timer.reset());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

