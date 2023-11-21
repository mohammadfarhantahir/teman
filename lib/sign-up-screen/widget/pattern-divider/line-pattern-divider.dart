import 'package:flutter/material.dart';

class LinePatternDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      width: double.infinity,
      child: CustomPaint(
        painter: LinePatternPainter(),
      ),
    );
  }
}

class LinePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double dashWidth = 10;
    final double dashSpace = 5;
    final double startY = size.height / 2;
    final double endX = size.width;

    double currentX = 0;

    while (currentX < endX) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        Paint()..color = Colors.black,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}