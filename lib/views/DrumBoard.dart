import 'package:audioplayers/audioplayers.dart';
import 'package:drum_pad/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ButtonModel.dart';

class DrumBoard extends StatelessWidget {
  DrumBoard({super.key});

  final List<Color> teal = [
    Colors.teal.shade300,
    Colors.teal.shade400,
    Colors.teal.shade600
  ];
  late List<Color> pink = [
    Colors.pink.shade300,
    Colors.pink.shade400,
    Colors.pink.shade600
  ];
  late List<Color> indigo = <Color>[
    Colors.indigo.shade300,
    Colors.indigo.shade400,
    Colors.indigo.shade600
  ];
  final List<Color> purple = [
    Colors.purple.shade300,
    Colors.purple.shade400,
    Colors.purple.shade600
  ];
  final List<Color> cyan = [
    Colors.cyan.shade300,
    Colors.cyan.shade400,
    Colors.cyan.shade600
  ];

  List<String> buttons = [
    'four.ogg',
    'five.ogg',
    'six.ogg',
    'one.mp3',
    'two.mp3',
    'three.mp3',
    'seven.mp3',
    'eight.mp3',
    'nine.mp3'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        itemCount: buttons.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) =>
            drumButton(context, index, buttons[index]),
      ),
    );
  }

  Widget drumButton(BuildContext context, int index, String data) {
    List<Color> colors = purple;
    if (index == 0)
      colors = cyan;
    else if (index == 2 || index == 4 || index == 6)
      colors = pink;
    else if (index == 5 || index == 7)
      colors = indigo;
    else if (index == 8) colors = teal;

    return Padding(
      padding: const EdgeInsets.all(7),
      child: GestureDetector(
        onTap: () async {
          Provider.of<AnimControl>(context, listen: false)
              .getController
              .forward();
          AudioPlayer()..play(AssetSource('$data'));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: RadialGradient(
              colors: [colors[0], colors[1], colors[2]],
              stops: const [0.1, 0.4, 0.8],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
