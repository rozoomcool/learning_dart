import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/shake_card.dart';

import '../domain/test_bloc.dart';
import '../model/test_model.dart';

class TestTile extends StatelessWidget {
  const TestTile({super.key, required this.test, required this.index});

  final TestModel test;
  final int index;

  final TextStyle primary = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w400, color: Colors.green);

  final TextStyle secondary =
      const TextStyle(fontSize: 12, color: Colors.blueGrey);

  final TextStyle easy = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green);
  final TextStyle middle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.amber);
  final TextStyle expert = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/test', arguments: {'test': test, 'index': index});
        context.read<TestBloc>().add(TestDoneResetByTestIndex(index));
      },
      splashColor: Colors.teal,
      // Цвет всплеска.
      highlightColor: Colors.red,
      // Цвет подсветки.
      borderRadius: BorderRadius.circular(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(test.title, style: primary, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Всего заданий: ${test.tasks.length}',
                      style: secondary, overflow: TextOverflow.ellipsis),
                  Text('Решено: ${test.done}/${test.tasks.length}',
                      style: secondary, overflow: TextOverflow.ellipsis),
                  Text(test.complexity.name,
                      style: test.complexity.name == "easy"
                          ? easy
                          : test.complexity.name == "middle"
                              ? middle
                              : expert,
                    overflow: TextOverflow.ellipsis)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
