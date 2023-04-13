import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gyber_landing/widget/animated_background.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  final double maxSize = 1024;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> pages = ["assets/1.svg", "assets/2.svg"];

  void reverse() => setState(() {
    pages = pages.reversed.toList();
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MediaQuery.of(context).size.width > widget.maxSize ? AnimatedBackground(size: size) : Container(),
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, i) => SingleChildScrollView(
                child: SvgPicture.asset(
              pages[i],
              width: MediaQuery.of(context).size.width > widget.maxSize
                  ? widget.maxSize
                  : MediaQuery.of(context).size.width,
            )),
          ),
          Container(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              width: MediaQuery.of(context).size.width > widget.maxSize
                  ? widget.maxSize
                  : MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => reverse(),
                        icon: const Icon(Icons.keyboard_arrow_left_outlined,
                            size: 100)),
                    IconButton(
                        onPressed: () => reverse(),
                        icon: const Icon(Icons.keyboard_arrow_right_outlined,
                            size: 100))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
