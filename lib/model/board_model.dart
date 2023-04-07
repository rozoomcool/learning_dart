import 'package:hive/hive.dart';
import 'package:notesboard/model/node_model.dart';


@HiveType(typeId: 1)
class BoardModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  BoardModel({required this.id, required this.title});
}