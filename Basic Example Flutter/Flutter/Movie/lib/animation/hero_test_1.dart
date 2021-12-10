import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({Key? key}) : super(key: key);

  static Widget _buildNextPage(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: InkWell(
            child: const Hero(
              tag: "DemoTag",
              child: Icon(
                Icons.wb_sunny,
                size: 250.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 15.0; // 1.0 is normal animation speed.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.topLeft,
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext context) => _buildNextPage(context),
              ));
            },
            child: const Hero(
              tag: "DemoTag",
              child: Icon(
                Icons.wb_sunny,
                size: 70.0,
              ),
            )),
      ),
    );
  }
}
