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
    return '${this.name} - ${this.yearOfProduction}';
  }
  void doSomething(){
    print('I am doing something...');
    this.handleEvent();
  }
  //method with named arguments ?
  void sayHello({required String personName}){
    print('Hello $personName');
    //_doSomething();//You can access "private" property inside
  }
  //function as "a variable"
  Function handleEvent;
}
