import 'package:drum_pad/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({super.key});

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with TickerProviderStateMixin {
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    // animation controller
    Provider.of<AnimControl>(context, listen: false).setController =
        AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..forward();

    // rotation
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: Provider.of<AnimControl>(context, listen: false).getController,
        curve: Curves.easeInOut));

    // radius -> from circle to square
    _radiusAnimation = Tween(begin: 450.0, end: 10.0).animate(CurvedAnimation(
        parent: Provider.of<AnimControl>(context, listen: false).getController,
        curve: Curves.easeInOut));

    Provider.of<AnimControl>(context, listen: false)
        .getController
        .addListener(() {
      setState(() {});
    });

    //make animation go back
    Provider.of<AnimControl>(context, listen: false)
        .getController
        .addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Provider.of<AnimControl>(context, listen: false)
            .getController
            .reverse();
      } else if (status == AnimationStatus.dismissed) {
        Provider.of<AnimControl>(context, listen: false)
            .getController
            .forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF692D94).withOpacity(0.8),
                        offset: const Offset(6.0, 6.0))
                  ],
                  color: Colors.deepPurple[900],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 2nd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.1,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(6.0, 6.0))
                  ],
                  color: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 3rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.2,
            child: Container(
              width: 175,
              height: 175,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(-5.0, -5.0))
                  ],
                  color: Colors.deepPurple[700],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 4rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.3,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(5.0, 5.0))
                  ],
                  color: Colors.deepPurple[600],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 5rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.4,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(-4.0, -4.0))
                  ],
                  color: Colors.deepPurple[500],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 6rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.5,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4.0, 4.0))
                  ],
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 7rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.6,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(-3.0, -3.0))
                  ],
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 7rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.7,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(3.0, 3.0))
                  ],
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),

          // 8rd biggest obj
          Transform.rotate(
            angle: _rotationAnimation.value + 0.8,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 209, 196, 233)
                            .withOpacity(0.9),
                        offset: const Offset(-3.0, -3.0))
                  ],
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),
        ],
      ),
    );
  }
}
