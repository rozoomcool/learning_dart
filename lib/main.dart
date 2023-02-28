import 'package:drum_pad/views/CircleAnimation.dart';
import 'package:drum_pad/views/DrumBoard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: ChangeNotifierProvider(
            create: (context) => AnimControl(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 100),
                Expanded(
                  child: Container(
                    child: CircleAnimation(),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: DrumBoard(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimControl extends ChangeNotifier {
  late AnimationController controller;

  AnimationController get getController => controller;

  set setController(AnimationController value) {
    controller = value;
  }
}
