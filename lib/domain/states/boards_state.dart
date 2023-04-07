import '../../model/board_model.dart';

class BoardsState{
  List<BoardModel> boards;

  BoardsState(this.boards);

  BoardsState.empty() : boards = List<BoardModel>.empty(growable: true);
}