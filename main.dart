import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const PaintScaffold(),
    );
  }
}

class PaintScaffold extends StatefulWidget {
  const PaintScaffold({Key? key}) : super(key: key);
  @override
  State<PaintScaffold> createState() => _PaintScaffoldState();
}
class _PaintScaffoldState extends State<PaintScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paint'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: CustomPaint(
                painter: CirclePainter(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CustomPaint(
                painter: RectPainter(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CustomPaint(
                painter: HeartPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint()
        ..color=Colors.lightGreen
        ..style=PaintingStyle.fill;
    canvas.drawCircle(const Offset(0, 0), 60, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var paint=Paint()
      ..color=Colors.blue
      ..strokeWidth=10
      ..style=PaintingStyle.stroke;
    canvas.drawRect(const Offset(-30, -30) & const Size(60, 60), paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeartPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var paint=Paint()
      ..color=Colors.red
      ..style=PaintingStyle.fill;
    var path=Path();
    path.moveTo(0, 0);
    path.lineTo(-30, -40);
    path.lineTo(-30, -60);
    path.lineTo(-10, -70);
    path.lineTo(0, -60);
    path.lineTo(10, -70);
    path.lineTo(30, -60);
    path.lineTo(30, -40);
    path.lineTo(0,0);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

