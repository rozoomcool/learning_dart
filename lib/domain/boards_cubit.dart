import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesboard/domain/states/boards_state.dart';
import 'package:notesboard/model/board_model.dart';

class BoardsCubit extends Cubit<BoardsState>{

  final Box<List<BoardModel>> _myBox = Hive.box('boards');

  BoardsCubit() : super(BoardsState.empty()){
      _myBox.put('boards', List<BoardModel>.empty(growable: true));
    updateBoards();
  }

  void addNewBoard(BoardModel model) {
    var boards = _myBox.get('boards')!;
    boards.add(model);
    emit(BoardsState(boards));

  }

  void updateBoards(){
    var boards = _myBox.get('boards')!;
    emit(BoardsState(boards));
  }

  @override
  Future<void> close() async {
    super.close();
    _myBox.close();
  }
}