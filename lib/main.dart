import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesboard/application/app.dart';
import 'package:notesboard/widgets/node_widget.dart';
import 'package:uuid/uuid.dart';

import 'model/board_model.dart';
import 'model/board_model_adapter.dart';
import 'model/node_model.dart';
import 'model/node_model_adapter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<BoardModel>(BoardModelAdapter());
  Hive.registerAdapter<NodeModel>(NodeModelAdapter());

  var b = await Hive.openBox<List<BoardModel>>("boards");
  var n = await Hive.openBox<List<NodeModel>>("nodes");

  b.put('boards', List<BoardModel>.empty(growable: true));
  n.put('nodes', List<NodeModel>.empty(growable: true));

  runApp(const MyApp());
}

var uuid = Uuid();

List<BoardModel> boards = [
  BoardModel(id: '1', title: "Test project"),
  BoardModel(id: '1', title: "Test project"),
  BoardModel(id: '2', title: "Test project"),
  BoardModel(id: '2', title: "Test project"),
  BoardModel(id: '2', title: "Test project")
  ];

var nodes = [
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '1', x: 0, y: 0),
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '1', x: 0, y: 0),
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '1', x: 0, y: 0),
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '2', x: 0, y: 0),
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '2', x: 0, y: 0),
  NodeModel(
      id: uuid.v4(),
      title: 'Start',
      content: 'Generate project and perform system', boardId: '2', x: 0, y: 0),
];
