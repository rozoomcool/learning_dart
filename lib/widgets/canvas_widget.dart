import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/scale_cubit.dart';
import 'package:notesboard/domain/states/transform_state.dart';

import '../domain/transform_cubit.dart';

class CanvasWidget extends StatelessWidget {
  const CanvasWidget({super.key});

  @override
  Widget build(BuildContext context) {

    double scale = context.watch<TransformCubit>().state.scale;

    return GestureDetector(
      onScaleUpdate: (details) {
        if (details.pointerCount == 2){
          context.read<TransformCubit>().updateScale(details.scale);
        } else if(details.pointerCount == 1){
          context
              .read<TransformCubit>()
              .updateOffset(details.focalPointDelta.dx / scale, details.focalPointDelta.dy / scale);
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return CustomPaint(
          painter: BackgroundPainter(
              radius: 2 * scale,
              color: Colors.blueGrey.shade800,
              size: Size(constraints.maxWidth, constraints.maxHeight),
              scale: scale),
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
      {required this.radius,
      required this.color,
      required this.size,
      required this.scale});

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
