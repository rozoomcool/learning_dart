import 'package:flutter/material.dart';
import 'package:notesboard/domain/boards_cubit.dart';
import 'package:notesboard/domain/nodes_cubit.dart';
import 'package:notesboard/model/node_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../model/board_model.dart';

class CreateNodeDialog extends StatefulWidget{
  String boardId;

  CreateNodeDialog( this.boardId, {super.key});

  @override
  State<CreateNodeDialog> createState() => _CreateNodeDialogState();
}

class _CreateNodeDialogState extends State<CreateNodeDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void save() {
    String name = _nameController.text;
    String content = _contentController.text;
    if(name.isNotEmpty && content.isNotEmpty){
      var uuid = const Uuid();
      NodeModel node = NodeModel(id: uuid.v4(), title: name, content: content, boardId: widget.boardId, x: 0, y: 0);
      context.read<NodesCubit>().addNewNode(node);
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
    _nameController.clear();
    _contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new node'),
      elevation: 24,
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Node name:',
            ),
          ),
          TextField(
            controller: _contentController,
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Content:',
            ),
          ),
        ],
      ),
      actions: [
        MaterialButton(onPressed: save, child: const Text('save')),
        MaterialButton(onPressed: cancel, child: const Text('cancel'))
      ],
    );
  }
}