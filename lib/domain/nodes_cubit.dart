import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesboard/domain/states/nodes_state.dart';

import '../model/board_model.dart';
import '../model/node_model.dart';

class NodesCubit extends Cubit<NodesState> {
  final Box<List<NodeModel>> _myBox = Hive.box('nodes');
  String boardId;

  NodesCubit(this.boardId) : super(NodesState.empty(boardId)) {
    // _myBox.put('nodes', List<NodeModel>.empty(growable: true));
  }

  void addNewNode(NodeModel model) {
    var nodes = _myBox.get('nodes')!;
    nodes.add(model);
    emit(NodesState(boardId, nodes));
  }

  void updateOffset(String id, double x, double y) {
    var current = state.nodes.where((element) => element.boardId == id).first;
    current.x += x;
    current.y += y;

    var nodes = _myBox.get('nodes')!;
    int index = nodes.indexWhere((element) => element.id == current.id);
    nodes.insert(index, current);

    emit(NodesState(boardId, nodes));
  }

  void updateNodes() {
    var nodes = _myBox.get('nodes')!;
    emit(NodesState(boardId, nodes));
  }

  @override
  Future<void> close() async {
    super.close();
    // _myBox.close();
  }
}
