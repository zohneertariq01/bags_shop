import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  final Color color;

  const DotIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(color: color);
  }
}

class _DotPainter extends BoxPainter {
  final Color color;

  _DotPainter({required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;


    final Offset circleOffset = Offset(
      configuration.size!.width / 2 + offset.dx,
      offset.dy + 5,
    );


    canvas.drawCircle(circleOffset, 4.5, paint);
  }
}