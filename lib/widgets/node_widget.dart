import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/transform_cubit.dart';

import '../domain/scale_cubit.dart';
import '../model/node_model.dart';

class Node extends StatelessWidget {
  NodeModel node;

  Node({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: context.watch<TransformCubit>().state.scale,
      child: Transform.translate(
        offset: Offset(context.watch<TransformCubit>().state.offsetX,
            context.watch<TransformCubit>().state.offsetY),
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.amber.shade100,
              border: Border.all(width: 1.5, color: Colors.amber.shade500),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 25,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: Colors.amber.shade500,
                    ),
                  )),
                  child: Center(
                      child: Text(
                    node.title,
                    style: TextStyle(color: Colors.teal.shade200),
                  ))),
              Padding(padding: const EdgeInsets.all(8.0),child: Center(child: Text(node.content, style: TextStyle(color: Colors.teal.shade600)),)),
            ],
          ),
        ),
      ),
    );
  }
}
