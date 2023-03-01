import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackerc/view/ConsoleAnimation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'PressStart',
          colorScheme: const ColorScheme.dark(),
          scaffoldBackgroundColor: Colors.grey.shade900),
      home: const Scaffold(
        body: Center(
          child: ConsoleAnimation(),
        ),
      ),
    );
  }
}
