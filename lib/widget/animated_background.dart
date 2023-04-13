import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key, required this.size});
  final Size size;

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  List<Offset> _offsets = [];
  final int _numShapes = 60;
  final double _shapeSize = 20.0;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..repeat();
    _initializeOffsets();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeOffsets() {
    for (int i = 0; i < _numShapes; i++) {
      _offsets.add(
        Offset(
          math.Random().nextDouble() * widget.size.width,
          math.Random().nextDouble()  *widget.size.height,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
            ),
            ..._offsets.map((offset) {
              return Positioned(
                left: offset.dx +
                    math.sin(_controller.value * math.pi * 2 +
                        _offsets.indexOf(offset) /
                            _numShapes *
                            math.pi *
                            2) *
                        100,
                top: offset.dy +
                    math.cos(_controller.value * math.pi * 2 +
                        _offsets.indexOf(offset) /
                            _numShapes *
                            math.pi *
                            2) *
                        100,
                child: Container(
                  width: _shapeSize,
                  height: _shapeSize,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}