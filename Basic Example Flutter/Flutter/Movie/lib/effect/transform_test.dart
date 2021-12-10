import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransformTest extends StatelessWidget {
  const TransformTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child: Container(
          color: Colors.black, // background 1
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.green, // background transform
              child: const Text('Hello GST, Flutter is so good'),
            ),
          ),
        ))));
  }
}
