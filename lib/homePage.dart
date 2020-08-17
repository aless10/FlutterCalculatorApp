import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Calculator"),
      ),
      body: Container(
        child: Center(
          child: Text("Calculator App"),
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
