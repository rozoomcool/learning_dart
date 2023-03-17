import 'package:flutter/material.dart';
import 'package:untitled4/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Так как мы запускаем main() асинхронно,
  // эта строчка гарантирует прогрузка наших виджетов и мы избегаем ошибок
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация Firebase в нашем проекте
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(primary: Colors.blueGrey),
      ),
      home: const LoginPage(),
    );
  }
}