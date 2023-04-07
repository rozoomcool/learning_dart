import 'package:flutter/material.dart';
import 'package:notesboard/domain/boards_cubit.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../model/board_model.dart';

class CreateBoardDialog extends StatefulWidget{
  const CreateBoardDialog({super.key});

  @override
  State<CreateBoardDialog> createState() => _CreateBoardDialogState();
}

class _CreateBoardDialogState extends State<CreateBoardDialog> {
  final TextEditingController _controller = TextEditingController();

  void save() {
    String boardName = _controller.text;
    if(boardName.isNotEmpty){
      var uuid = const Uuid();
      BoardModel board = BoardModel(title: boardName, id: uuid.v4());
      context.read<BoardsCubit>().addNewBoard(board);
    }
    Navigator.pop(context);
    clear();
  }

  // cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new board'),
      elevation: 24,
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Board name:',
        ),
      ),
      actions: [
        MaterialButton(onPressed: save, child: const Text('save')),
        MaterialButton(onPressed: cancel, child: const Text('cancel'))
      ],
    );
  }
}