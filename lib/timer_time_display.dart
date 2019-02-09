import 'package:flutter/material.dart';
import 'package:timer/timer.dart';
import 'package:intl/intl.dart';

class TimerTimeDisplay extends StatefulWidget {

  final timerState;
  final selectionTime;
  final countdownTime;

  TimerTimeDisplay({
    this.timerState,
    this.selectionTime = const Duration(seconds: 0),
    this.countdownTime = const Duration(seconds: 0),
});

  @override
  _TimerTimeDisplayState createState() => _TimerTimeDisplayState();
}

class _TimerTimeDisplayState extends State<TimerTimeDisplay> with TickerProviderStateMixin {

  final DateFormat selectionTimeFormat =  DateFormat('mm');
  final DateFormat countdownTimeFormat =  DateFormat('mm:ss');

  AnimationController selectionTimeSlideController;
  AnimationController countdownTimeFadeController;


  @override
  void initState() {
    super.initState();

    selectionTimeSlideController = AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this,
    )
    ..addListener((){
      setState((){});
    });

    countdownTimeFadeController = AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this,
    )
    ..addListener((){
      setState(() {

      });
    });

    countdownTimeFadeController.value = 1.0;
  }


  @override
  void dispose() {
    selectionTimeSlideController.dispose();
    countdownTimeFadeController.dispose();
    super.dispose();
  }

  get formattedSelectionTime {
    DateTime dateTime = DateTime(DateTime.now().year,0,0,0,0, widget.selectionTime.inSeconds);
    return selectionTimeFormat.format(dateTime);
  }

  get formattedCountdownTime {
    DateTime dateTime = DateTime(DateTime.now().year,0,0,0,0, widget.countdownTime.inSeconds);
    return countdownTimeFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {

    if(widget.timerState == TimerState.ready) {
      selectionTimeSlideController.reverse();
      countdownTimeFadeController.forward();
    }else {
      selectionTimeSlideController.forward();
      countdownTimeFadeController.reverse();
    }
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stack(
          alignment: Alignment.center,
          children: [Transform(
            transform: Matrix4.translationValues(
                0.0,
                -200.0 * selectionTimeSlideController.value,
                0.0
            ),
            child: Text(
              formattedSelectionTime,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Bebas Neue',
                fontSize: 150,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
              ),),
          ),
          Opacity(
            opacity: 1.0 - countdownTimeFadeController.value,
            child: Text(
              formattedCountdownTime,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Bebas Neue',
                fontSize: 150,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
              ),),
          ),
          ]
        ));
  }
}
