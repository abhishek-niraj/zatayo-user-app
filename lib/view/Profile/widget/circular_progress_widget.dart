import 'package:flutter/material.dart';

import '../../common_widget/common_text_widget.dart';

class CircularBorderPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0

  CircularBorderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint greyPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Paint greenPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw full grey circle
    canvas.drawCircle(center, radius, greyPaint);

    // Draw green border based on progress
    double sweepAngle = 2 * 3.141592653589793 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start from top
      sweepAngle,
      false,
      greenPaint,
    );
  }

  @override
  bool shouldRepaint(CircularBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// Usage
class CircularBorderWidget extends StatefulWidget {
  final double progress;
  final String completedText;

  const CircularBorderWidget(
      {this.progress = 0.0, this.completedText = "", super.key});

  @override
  _CircularBorderWidgetState createState() => _CircularBorderWidgetState();
}

class _CircularBorderWidgetState extends State<CircularBorderWidget> {
  double progress = 0.0;

  void increaseProgress() {
    setState(() {
      progress = (progress + 0.1).clamp(0.0, 1.0); // Increase by 10% each time
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(90, 90),
            painter: CircularBorderPainter(widget.progress),
          ),
          Positioned(
              child: Align(
                alignment: Alignment.center,
                child: CommonTextWidget(
                            text: widget.completedText,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
              )),
        ],
      ),
    );
  }
}
