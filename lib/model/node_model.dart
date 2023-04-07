import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class NodeModel{
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  String boardId;

  @HiveField(4)
  double x;

  @HiveField(5)
  double y;

  NodeModel({required this.id, required this.title, required this.content, required this.boardId, required this.x, required this.y});
}