import 'package:flutter/material.dart';
import 'package:uml_diagrams/model/task_model.dart';

class DiagramWidget extends StatelessWidget {
  TaskModel task;

  DiagramWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.amber.shade100,
          border: Border.all(width: 1.5, color: Colors.amber.shade500),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 25,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.amber.shade500,
                ),
              )),
          child: Center(child: Text(task.title, style: TextStyle(color: Colors.teal.shade200),))),
          Container(),
        ],
      ),
    );
  }
}
