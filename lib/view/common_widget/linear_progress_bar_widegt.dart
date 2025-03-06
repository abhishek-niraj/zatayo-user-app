import 'package:flutter/material.dart';

class LinearProgressBarPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0

  LinearProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint greyPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;



    Paint redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    // Draw full grey background line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      greyPaint,
    );

    // Draw progress line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * progress, size.height / 2),
      redPaint,
    );
  }

  @override
  bool shouldRepaint(LinearProgressBarPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class LinearProgressBarWidget extends StatefulWidget {
  final double progress;
  final String completedText;

  const LinearProgressBarWidget({
    this.progress = 0.0,
    this.completedText = "",
    super.key,
  });

  @override
  _LinearProgressBarWidgetState createState() => _LinearProgressBarWidgetState();
}

class _LinearProgressBarWidgetState extends State<LinearProgressBarWidget> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 30),
            painter: LinearProgressBarPainter(widget.progress),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.completedText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
