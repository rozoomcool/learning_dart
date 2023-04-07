import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/transform_cubit.dart';
import 'package:notesboard/model/node_model.dart';
import 'package:notesboard/widgets/create_node_dialog.dart';
import 'package:notesboard/widgets/node_widget.dart';

import '../domain/nodes_cubit.dart';
import '../domain/scale_cubit.dart';
import '../domain/states/nodes_state.dart';
import '../domain/states/transform_state.dart';
import '../widgets/canvas_widget.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NodesCubit, NodesState>(
      builder: (context, nodeState) => Scaffold(
        appBar: AppBar(
          title: const Text("board"),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => TransformCubit(),
          child: BlocBuilder<TransformCubit, TransformState>(
              builder: (context, state) => Stack(
          alignment: Alignment.center,
          children: [
            const CanvasWidget(),
            Node(
                node: NodeModel(
                    id: 'fe',
                    title: "fefe",
                    boardId: 'fwf',
                    content: "fefe",
                    x: 0,
                    y: 0)),
            ...nodeState.nodes.map((e) => GestureDetector(
                  onPanUpdate: (details) {},
                  child: Transform.translate(
                    offset: Offset(e.x, e.y),
                    child: Transform.scale(
                        scale: context.watch<TransformState>().scale,
                        child: Node(node: e)),
                  ),
                ))
          ],
              ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => CreateNodeDialog(nodeState.boardId)),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
