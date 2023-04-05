import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uml_diagrams/domain/boards_provider.dart';
import 'package:uml_diagrams/widgets/board_tile_block.dart';
import 'package:uml_diagrams/widgets/create_board_dialog.dart';

import '../model/board_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<BoardModel> boards = context.watch<BoardsProvider>().boards;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks board'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
          itemCount: boards.length,
          itemBuilder: (context, index) => BoardTileBlock(board: boards[index], index: index,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(context: context, builder: (context) => const CreateBoardDialog())),
    );
  }
}
