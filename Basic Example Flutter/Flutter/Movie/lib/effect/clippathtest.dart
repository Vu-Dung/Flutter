import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipPathTest extends StatelessWidget {
  const ClipPathTest({Key? key}) : super(key: key);

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
    return ClipPath(
      child: Image.asset('lib/resources/images/image_test.png'),
      clipper: MyCustomClipper(),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = _getRandomPath(size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

  Path _getRandomPath(Size size) {
    var path = Path();
    path.lineTo(0, 220);
    path.quadraticBezierTo(size.width / 4, 160, size.width / 2, 175);
    path.quadraticBezierTo(3 / 4 * size.width, 190, size.width, 130);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
}
