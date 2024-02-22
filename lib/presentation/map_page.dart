import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Color _color = Colors.green;
  List<DrawingArea> circles = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://i.etsystatic.com/9985176/r/il/77b94b/1486798916/il_1588xN.1486798916_2z3s.jpg',
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTapDown: (details) {
            setState(() {
              circles.add(DrawingArea(
                point: details.localPosition,
                radius: 20.0,
              ));
            });
          },
          child: CustomPaint(
            size: Size.infinite,
            painter: DrawingPainter(circlesList: circles, color: _color),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () => setState(() {
                    _color = Colors.red;
                  }),
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () => setState(() {
                    _color = Colors.green;
                  }),
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  onPressed: () => setState(() {
                    _color = Colors.purple;
                  }),
                  backgroundColor: Colors.purple,
                ),
                FloatingActionButton(
                  onPressed: () => setState(() {
                    _color = Colors.brown;
                  }),
                  backgroundColor: Colors.brown,
                ),
                FloatingActionButton(
                  onPressed: () => setState(() {
                    circles = [];
                  }),
                  backgroundColor: Colors.white30,
                ),
              ],
            ),
          ),
        ),
        Align(alignment: Alignment.topCenter, child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(8.0),
          child: Text('Пометь всех животных одним цветом!', style: TextStyle(fontSize: 20, color: Colors.white),),
        ),)
      ],
    );
  }
}

class DrawingPainter extends CustomPainter {
  List<DrawingArea> circlesList;
  Color color;

  DrawingPainter({required this.circlesList, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var temp = color;
    Paint paint = Paint()
      ..color = temp
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    for (DrawingArea circle in circlesList) {
      canvas.drawCircle(circle.point, circle.radius, Paint()..color=temp..style=PaintingStyle.fill..isAntiAlias=true);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingArea {
  Offset point;
  double radius;

  DrawingArea({required this.point, required this.radius});
}
