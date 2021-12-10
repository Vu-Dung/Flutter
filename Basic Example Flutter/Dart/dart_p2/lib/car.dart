import 'package:flutter/cupertino.dart';

class Car {
  String name;
  int yearOfProduction;

  Car({
    required this.name,//@required = Not null(warning),
    this.yearOfProduction = 2020//what about "default parameter" ?
  });
  //
  @override
  String toString() {
    // TODO: implement toString
    return '$name - ${yearOfProduction}';
  }
  void doSomething(){
    print('I am doing something...');
    handleEvent();
  }
  //method with named arguments ?
  void sayHello({String personName}){
    print('Hello $personName');
  }
  //function as "a variable"
  Function handleEvent;
}
