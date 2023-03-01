import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsoleAnimation extends StatelessWidget {
  const ConsoleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Console(), child: const ConsoleList());
  }
}

class ConsoleList extends StatefulWidget {
  const ConsoleList({super.key});

  @override
  State<ConsoleList> createState() => _ConsoleListState();
}

class _ConsoleListState extends State<ConsoleList> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Console>(context, listen: false).generate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: Provider.of<Console>(context).data.length,
      itemBuilder: (context, index) =>
          Provider.of<Console>(context).data[index],
    );
  }
}

class Console extends ChangeNotifier {
  List<Widget> data = [];

  Future<void> generate() async {
    while (true) {
      await Future<void>.delayed(Duration(milliseconds: 10));
      List<String> genText = List.generate(
          7,
          (index) =>
              (String.fromCharCode(Random().nextInt(126 - 33) + 33)) +
              (String.fromCharCode(Random().nextInt(126 - 33) + 33)));

      if (data.length >= 100) {
        data = data.sublist(0, 45);
      }

      data.insert(
          0,
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(genText[0],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[1],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[2],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[3],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[4],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[5],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[6],
                      style: green, overflow: TextOverflow.ellipsis),
                ]),
          ));
      notifyListeners();
    }
  }
}

const TextStyle green = TextStyle(color: Colors.green, shadows: [
  Shadow(color: Colors.green, blurRadius: 5, offset: Offset(2, 2))
]);
