import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uml_diagrams/domain/boards_provider.dart';
import 'package:uml_diagrams/widgets/canvas_widget.dart';
import 'package:uml_diagrams/widgets/diagram_widget.dart';

import '../model/board_model.dart';

class BoardPage extends StatefulWidget {
  final BoardModel board;

  const BoardPage({super.key, required this.board});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.board.title),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const CanvasWidget(),
          ...widget.board.tasks.map((e) => GestureDetector(
                child: Positioned(
                  top: e.y,
                  left: e.x,
                  child: Transform.scale(
                      scale: context.watch<BoardsProvider>().scale,
                      child: DiagramWidget(task: e)),
                ),
              ))
        ],
      ),
    );
  }
}
