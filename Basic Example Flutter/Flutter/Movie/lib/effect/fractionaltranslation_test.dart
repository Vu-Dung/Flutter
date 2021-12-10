import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FractionalTranslationTest extends StatelessWidget {
  const FractionalTranslationTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Container(
            color: Colors.black26,
            child: const FractionalTranslation(
              child: Text('Hello GST! Flutter is so good!!!',
                  style: TextStyle(color: Colors.teal, fontSize: 20)),
              translation: Offset(-0.2, 1.0),
            ),
          )),
        ));
  }
}
