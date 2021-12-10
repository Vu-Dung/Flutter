import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipRectTest extends StatelessWidget {
  const ClipRectTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: buildClipPath(),
          ),
        ));
  }

  buildClipPath() {
    return ClipRect(
      child: Image.asset('lib/resources/images/image_test.png'),
      clipper: TestClipper(),
    );
  }
}

class TestClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 101, 101);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
