import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/boards_cubit.dart';
import 'package:provider/provider.dart';

import '../domain/nodes_cubit.dart';
import '../model/board_model.dart';
import '../presentation/board_page.dart';

class BoardTileBlock extends StatefulWidget {
  final BoardModel board;

  const BoardTileBlock({super.key, required this.board});

  @override
  State<BoardTileBlock> createState() => _BoardTileBlockState();
}

class _BoardTileBlockState extends State<BoardTileBlock> {
  bool isGoToBoard = false;
  double _scale = 1;

  void toggleIsGoToBoard() => setState(() {
        isGoToBoard = !isGoToBoard;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _scale = 1.1;
        Future.delayed(
            const Duration(milliseconds: 300),
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider<NodesCubit>(
                        create: (context) => NodesCubit(widget.board.id),
                        child: const BoardPage()))));
      }),
      child: AnimatedScale(
        curve: Curves.easeInOutBack,
        scale: _scale,
        onEnd: () => setState(() {
          _scale = 1;
        }),
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 40, 40, 40),
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 4)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                    radius: 30, child: Icon(Icons.developer_board_off)),
                Text(widget.board.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
