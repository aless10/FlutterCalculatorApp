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
          padding: const EdgeInsets.all(40.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number 1"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number 2"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(child: Text("+"), onPressed: null, color: Colors.greenAccent,),
                MaterialButton(child: Text("-"), onPressed: null, color: Colors.greenAccent),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(child: Text("*"), onPressed: null, color: Colors.greenAccent),
                MaterialButton(child: Text("/"), onPressed: null, color: Colors.greenAccent)
              ],
            )
          ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
