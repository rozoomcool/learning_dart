import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/states/boards_state.dart';
import 'package:notesboard/model/board_model.dart';

import '../domain/boards_cubit.dart';
import '../widgets/board_tile_block.dart';
import '../widgets/create_board_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardsCubit, BoardsState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Tasks board'),
                centerTitle: true,
              ),
              body: state.boards.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15),
                        itemCount: state.boards.length,
                        itemBuilder: (context, index) => BoardTileBlock(
                          board: state.boards[index],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text('NOTHING...'),
                    ),
              floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const CreateBoardDialog())),
            ));
  }
}
