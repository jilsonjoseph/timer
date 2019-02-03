import 'package:flutter/material.dart';
import 'package:timer/timer_button.dart';

class TimerControls extends StatefulWidget {
  @override
  _TimerControlsState createState() => _TimerControlsState();
}

class _TimerControlsState extends State<TimerControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TimerButton(
              icon:Icons.refresh,
              text:'RESTART',
            ),
            Expanded(child: new Container()),
            TimerButton(
              icon:Icons.arrow_back,
              text: 'RESET',
            )
          ],
        ),
        TimerButton(
            icon:Icons.pause,
            text:'PAUSE'
        )
      ],
    );
  }
}
