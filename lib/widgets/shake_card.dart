import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/current_test_provider.dart';
import '../domain/test_bloc.dart';

class ShakeCard extends StatefulWidget {
  final String text;

  final TextStyle textStyle =
  const TextStyle(fontSize: 14, color: Colors.blueGrey);

  const ShakeCard({super.key, required this.text});

  @override
  _ShakeCardState createState() => _ShakeCardState();
}

class _ShakeCardState extends State<ShakeCard>
    with SingleTickerProviderStateMixin {

  bool isToggle = true;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 30),
    vsync: this,
  );

  late final Animation<double> _animation = Tween<double>(
    begin: 0.0,
    end: 10.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

  @override
  void initState(){
    super.initState();

    _controller.addListener(() {
      if(_controller.isCompleted){
        _controller.reverse();
        _controller.forward();
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          _controller.forward();
          toggle();
          Future.delayed(const Duration(milliseconds: 500), () {
            context.read<CurrentTaskProvider>().incrementCurrent();
          });
        },
        child: Card(
          color: isToggle ? Theme.of(context).cardColor : Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.text, style: widget.textStyle),
          ),
        ),
      ),
    );
  }

  void toggle(){
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}