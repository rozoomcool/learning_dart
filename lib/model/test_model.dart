import 'package:test_app/model/complexity.dart';
import 'package:test_app/model/task_model.dart';

class TestModel {
  final String title;
  final List<TaskModel> tasks;
  int done = 0;
  Complexity complexity;

  TestModel(this.title, this.tasks, this.complexity);
}