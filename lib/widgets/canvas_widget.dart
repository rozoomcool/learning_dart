import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uml_diagrams/domain/boards_provider.dart';

class CanvasWidget extends StatelessWidget{
  const CanvasWidget({super.key});

  @override
  Widget build(BuildContext context) {

    double scale = context.watch<BoardsProvider>().scale;

    return GestureDetector(
      onScaleUpdate: (details) {
        context.read<BoardsProvider>().updateScale(details.scale);
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return CustomPaint(
          painter: BackgroundPainter(
            radius: 2 * scale,
            color: Colors.blueGrey.shade200,
            size: Size(constraints.maxWidth, constraints.maxHeight),
            scale: scale
          ),
          size: Size.infinite,
        );
      }),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double radius;
  final Color color;
  final Size size;
  final double scale;

  const BackgroundPainter(
      {required this.radius, required this.color, required this.size, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double xSpacing = radius * 12 * scale;
    final double ySpacing = radius * 12 * scale;

    int numCirclesX = (size.width / xSpacing).ceil();
    int numCirclesY = (size.height / ySpacing).ceil();

    for (int i = 0; i < numCirclesX; i++) {
      for (int j = 0; j < numCirclesY; j++) {
        double xPos = (i * xSpacing) + radius + (12 * scale) * scale;
        double yPos = (j * ySpacing) + radius + (12 * scale) * scale;

        canvas.drawCircle(Offset(xPos, yPos), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BackgroundPainterSecond extends CustomPainter {
  final random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    for (var i = 0; i < 1000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}