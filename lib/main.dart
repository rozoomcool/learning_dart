import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation//home_page.dart';
import 'package:test_app/presentation/splash_page.dart';
import 'package:test_app/presentation/test_page.dart';

import 'domain/test_bloc.dart';
import 'model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TestBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          initialRoute: '/splash',
          routes: {
            '/': (context) => const HomePage(),
            '/splash': (context) => const SplashPage(),
            '/test': (context) => const TestPage()
          },
        ));
  }
}
