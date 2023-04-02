import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/current_test_provider.dart';

import 'package:test_app/domain/test_bloc.dart';

class ScaleCard extends StatefulWidget {
  final String text;

  final TextStyle textStyle =
      const TextStyle(fontSize: 14, color: Colors.blueGrey);

  const ScaleCard({super.key, required this.text});

  @override
  _ScaleCardState createState() => _ScaleCardState();
}

class _ScaleCardState extends State<ScaleCard> with TickerProviderStateMixin {
  bool isToggle = true;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 150),
    vsync: this,
  );

  late final Animation<double> _animation = Tween<double>(
    begin: 1,
    end: 1.15,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

  void toggle() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedBuilder(
  //       animation: _animation,
  //       builder: (context, child) {
  //         return Transform.scale(
  //           scale: _animation.value,
  //           child: child,
  //         );
  //       },
  //       child: GestureDetector(
  //         onTap: () {
  //           _controller.forward();
  //           toggle();
  //           Future.delayed(const Duration(milliseconds: 500), () {
  //             context.read<TestBloc>().add(TestIncrementDoneByTestIndex(
  //                 context.read<CurrentTaskProvider>().testIndex));
  //             context.read<CurrentTaskProvider>().incrementCurrent();
  //           });
  //         },
  //         child: Card(
  //           color: isToggle ? Theme.of(context).cardColor : Colors.green,
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Text(widget.text, style: widget.textStyle),
  //           ),
  //         ),
  //       ));
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggle(),
      child: AnimatedScale(
        scale: isToggle?1:1.2,
        duration: const Duration(milliseconds: 75),
        onEnd: (){
            // toggle();
            // Future.delayed(const Duration(milliseconds: 500), () {
              context.read<TestBloc>().add(TestIncrementDoneByTestIndex(
                  context.read<CurrentTaskProvider>().testIndex));
              context.read<CurrentTaskProvider>().incrementCurrent();
            // });
        },
        child: Card(
            color: isToggle ? Theme.of(context).cardColor : Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.text, style: widget.textStyle),
            )),
      ),
    );
  }
}
