import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class SeaAnimation extends StatelessWidget {
  const SeaAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lotties/sea-walk.json',
          repeat: true, height: 300, width: 300),
    );
  }
}
