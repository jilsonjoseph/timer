import 'package:flutter/material.dart';
import 'package:timer/timer_knob.dart';
import "dart:math";

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class TimerDial extends StatefulWidget {

  final Duration currentTime;
  final Duration maxTime;
  final int ticksPerSection;


  TimerDial({
    this.currentTime = const Duration(minutes: 0),
    this.maxTime = const Duration(minutes: 35),
    this.ticksPerSection = 5,
  });

  @override
  _TimerDialState createState() => _TimerDialState();
}

class _TimerDialState extends State<TimerDial> {

  rotationPercent(){
    return widget.currentTime.inSeconds / widget.maxTime.inSeconds;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [GRADIENT_TOP,GRADIENT_BOTTOM],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x44000000),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 1.0),
                    )
                  ]
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(55.0),
                    child: CustomPaint(
                      painter: TickPainter(
                        tickCount: widget.maxTime.inMinutes,
                        ticksPerSection: widget.ticksPerSection,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(65.0),
                    child: TimerKnob(
                      rotationPercent()
                    ),
                  ),
                ]
              ),
            ),
          ),
        )
    );
  }
}

class TickPainter extends CustomPainter{

  final LONG_TICK = 14.0;
  final SHORT_TICK = 4.0;

  final tickCount;
  final ticksPerSection;
  final tickInset;
  final tickPaint;
  final textPainter;
  final textStyle;


  TickPainter({
    this.tickCount = 35,
    this.ticksPerSection = 5,
    this.tickInset = 0,
}) : tickPaint = new Paint(),
    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    ),
  textStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'BebasNeue',
    fontSize: 20.0,
  ){
    tickPaint.color = Colors.black;
    tickPaint.strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width/2, size.height/2);

    canvas.save();

    final radius = size.width/2;

    for(var i = 0; i< tickCount; ++i){
      final tickLength = i % ticksPerSection == 0 ? LONG_TICK : SHORT_TICK;

      canvas.drawLine(
          Offset(0.0, -radius),
          Offset(0.0, -radius -tickLength),
          tickPaint
      );

      if(i % ticksPerSection == 0){
        //Paint text.
        canvas.save();
        canvas.translate(0.0, -(size.width/2) - 30.0);

        textPainter.text = TextSpan(
          text: '$i',
          style: textStyle,
        );

        // Layout the text
        textPainter.layout();

        // Finding quadrant for text
        final tickPercent = i / tickCount;
        var quadrant;
        if (tickPercent < 0.25){
          quadrant = 1;
        }else if (tickPercent < 0.5){
          quadrant = 4;
        }else if (tickPercent < 0.75) {
          quadrant = 3;
        }else {
          quadrant = 2;
        }

        switch (quadrant){
          case 4:
            canvas.rotate(-pi/2);
            break;
          case 2:
          case 3:
            canvas.rotate(pi/2);
            break;

        }

        textPainter.paint(
          canvas,
          Offset(
            -textPainter.width / 2,
            -textPainter.height / 2,
          ),
        );

        canvas.restore();
      }

      canvas.rotate(2*pi / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

