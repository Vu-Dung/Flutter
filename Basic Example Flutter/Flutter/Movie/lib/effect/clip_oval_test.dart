import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipOvalTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClipOvalTestState();
  }
}

class ClipOvalTestState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Image.asset('lib/resources/images/image_test.png'),
          ),
        ));
  }
}

class TestClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, double.infinity, double.infinity);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
