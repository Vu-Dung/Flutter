import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DecoratedBoxTest extends StatelessWidget {
  const DecoratedBoxTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: DecoratedBox(
              child: Container(
                width: 200,
                height: 200,
                child: const Icon(
                  Icons.wb_sunny,
                  size: 100,
                  color: Colors.orange,
                ),
              ),
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10.0,
                    spreadRadius: 4.0,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
