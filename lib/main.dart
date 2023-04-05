import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uml_diagrams/domain/boards_provider.dart';
import 'package:uml_diagrams/presentation/board_page.dart';
import 'package:uml_diagrams/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BoardsProvider>(
      create: (BuildContext context) => BoardsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(

        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage()
        },
      ),
    );
  }
}
