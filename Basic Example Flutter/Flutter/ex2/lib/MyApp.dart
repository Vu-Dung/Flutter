import 'package:flutter/cupertino.dart' show BorderRadius, BuildContext, Center, Column, Container, EdgeInsets, MainAxisAlignment, Radius, State, StatefulWidget, Text, TextEditingController, TextStyle, Widget;
import 'package:flutter/material.dart';
//You can define your own Widget
class MyApp extends StatefulWidget {
  //StatefulWidget has internal "state"
  String name;
  int age;
  MyApp({required this.name, required this.age});//name, age is state ? No !, it is properties
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  String _email = '';//This is state!
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Now add a state ?
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text){
                    this.setState((){
                      _email = text;//when state changed => build() rerun => reload widget
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10)
                        ),
                      ),
                      labelText:'Enter your email',
                  ),
                ),
              ),
              Text(
                'See result here: ',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
            ],
          )
        ),
      )
    );
  }
}
