import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/domain/current_test_provider.dart';
import 'package:test_app/widgets/lottie_sea_animation.dart';
import 'package:test_app/widgets/task_widget.dart';

import '../model/test_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final TestModel? test = args!['test'];
    final int index = args!['index'];

    return Scaffold(
      appBar: AppBar(
        title: Text(test!.title),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
          create: (context) => CurrentTaskProvider(test.tasks.length - 1, index),
          child: Consumer<CurrentTaskProvider>(
            builder: (context, model, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 20),
                    model.current <= model.last
                        ? AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: TaskWidget(key: UniqueKey(),task: test.tasks[model.current]))
                        : ElevatedButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Text('Завершить')),
                    const SizedBox(height: 60),
                    const SeaAnimation()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
