import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackdropFilterTest extends StatefulWidget {
  const BackdropFilterTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BackdropFilterTestState();
  }
}

class BackdropFilterTestState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Text('0' * 10000), // background 10000 "0" character
            // buildCenterBackDropFilter(),
            buildCenterFilter(),
          ],
        )),
      ),
    );
  }

  buildCenterBackDropFilter() {
    return Center(
      child: ClipRect(
        // <-- clips to the 200x200 [Container] below
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          child: Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }

  buildCenterFilter() {
    return Center(
      child: ClipRect(
        // <-- clips to the 200x200 [Container] below
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          child: Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
