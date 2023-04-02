import 'package:flutter/material.dart';
import 'package:test_app/model/task_model.dart';
import 'package:test_app/widgets/scale_card.dart';
import 'package:test_app/widgets/shake_card.dart';

class TaskWidget extends StatelessWidget {
  TaskModel task;

  TaskWidget({required super.key, required this.task});

  final head = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 25, color: Colors.green, overflow: TextOverflow.visible);

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(task.question, style: head),
          const SizedBox(height: 20),
          ListView.builder(
            padding: const EdgeInsets.only(right: 30, left: 30),
            shrinkWrap: true,
              itemCount: task.options.length,
              itemBuilder: (context, snapshot) => task.answerId == snapshot
                  ? ScaleCard(text: task.options[snapshot])
                  : ShakeCard(text: task.options[snapshot]))
        ],
      ),
    );
  }
}
