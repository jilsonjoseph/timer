import 'package:flutter/material.dart';
import 'package:timer/timer_knob.dart';
import "dart:math";

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

class TimerDial extends StatefulWidget {
  @override
  _TimerDialState createState() => _TimerDialState();
}

class _TimerDialState extends State<TimerDial> {
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

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(65.0),
                    child: TimerKnob(),
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

  TickPainter({
    this.tickCount = 35,
    this.ticksPerSection = 5,
    this.tickInset = 0,
}) : tickPaint = new Paint() {
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

      canvas.rotate(2*pi / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

