import 'package:uml_diagrams/model/task_model.dart';

class BoardModel{
  String title;
  List<TaskModel> tasks;

  BoardModel({required this.title, required this.tasks});
}