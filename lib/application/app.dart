import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/transform_cubit.dart';
import 'package:notesboard/presentation/board_page.dart';
import 'package:notesboard/presentation/home_page.dart';

import '../domain/boards_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardsCubit>(
        create: (context) => BoardsCubit(),
        child: MaterialApp(
            title: 'Notesboard',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/board': (context) => const BoardPage()
            }));
  }
}
