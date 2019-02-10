import 'package:flutter/material.dart';
import 'package:timer/timer.dart';
import 'package:timer/timer_button.dart';

class TimerControls extends StatefulWidget {

  final timerState;
  final Function() onPause;
  final Function() onResume;
  final Function() onRestart;
  final Function() onReset;

  TimerControls({
    this.timerState,
    this.onPause,
    this.onResume,
    this.onRestart,
    this.onReset,
});

  @override
  _TimerControlsState createState() => _TimerControlsState();
}

class _TimerControlsState extends State<TimerControls> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 1.0,
          child: Row(
            children: [
              TimerButton(
                icon:Icons.refresh,
                text:'RESTART',
                onPressed: widget.onRestart,
              ),
              Expanded(child: new Container()),
              TimerButton(
                icon:Icons.arrow_back,
                text: 'RESET',
                onPressed: widget.onReset,
              )
            ],
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(0.0,0.0,0.0),
          child: TimerButton(
            icon:widget.timerState == TimerState.running ? Icons.pause : Icons.play_arrow,
            text:widget.timerState == TimerState.running ? 'PAUSE' : 'RESUME',
            onPressed: widget.timerState == TimerState.running
                ? widget.onPause
                : widget.onResume,
          ),
        )
      ],
    );
  }
}
