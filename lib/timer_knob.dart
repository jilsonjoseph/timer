import 'package:flutter/material.dart';


final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);


class TimerKnob extends StatefulWidget {
  @override
  _TimerKnobState createState() => _TimerKnobState();
}

class _TimerKnobState extends State<TimerKnob> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: ArrowPainter(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
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
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1.5,
                  )

              ),
              child: new Center(
                child: new Image.asset('assets/icons_circled_j.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),]
    );
  }
}

class ArrowPainter extends CustomPainter{

  final Paint dialArrowPaint;

  ArrowPainter() : dialArrowPaint = new Paint() {
    dialArrowPaint.color = Colors.black;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.translate(size.width/2, 0.0);
    Path path = Path();
    path.moveTo(0.0, -10.0);
    path.lineTo(10.0, 5.0);
    path.lineTo(-10.0, 5.0);
    path.close();

    canvas.drawPath(path, dialArrowPaint);
    canvas.drawShadow(path, Colors.black, 3.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
