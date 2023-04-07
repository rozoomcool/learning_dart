import '../../model/node_model.dart';

class NodesState{
  String boardId;
  List<NodeModel> nodes;

  NodesState(this.boardId, this.nodes);

  NodesState.empty(this.boardId) : nodes = List<NodeModel>.empty(growable: true);
}