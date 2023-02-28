import 'package:crypto_viewer/controller/TrackerProvider.dart';
import 'package:crypto_viewer/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto viewer',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: ChangeNotifierProvider(
          create: (context) => TrackerProvider(),
          child: const SafeArea(child: HomePage()),
        ));
  }
}
