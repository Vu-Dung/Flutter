import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OpacityTest extends StatelessWidget {
  const OpacityTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
            body: Center(
          child: Opacity(
            opacity: 0.3,
            child: Text("Hello GST, Flutter is so Good!!",
                style: TextStyle(color: Colors.teal, fontSize: 20)),
          ),
        )));
  }
}
