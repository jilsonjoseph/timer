import 'package:flutter/material.dart';
class TimerTimeDisplay extends StatefulWidget {
  @override
  _TimerTimeDisplayState createState() => _TimerTimeDisplayState();
}

class _TimerTimeDisplayState extends State<TimerTimeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text(
          '15:49',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Bebas Neue',
            fontSize: 150,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),));
  }
}
