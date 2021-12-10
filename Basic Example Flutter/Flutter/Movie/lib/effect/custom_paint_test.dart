import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPaintTest extends StatelessWidget {
  const CustomPaintTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CustomPaint(
              size: const Size(200, 200),
              painter: MyPainter(),
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  final _paint = Paint();

  MyPainter() {
    _paint.color = Colors.teal;
    _paint.strokeWidth = 3;
    _paint.strokeCap = StrokeCap.square;
    _paint.style = PaintingStyle.stroke;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(const Offset(0, 0), const Offset(200, 200), _paint);
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 100, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
