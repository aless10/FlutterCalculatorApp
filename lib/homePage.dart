import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hey you!"),
    content: Text("You cannot divide by 0. Please use another number as denominator."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


class HomePageState extends State<MyHomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void add() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void sub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void multiply() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void divide(BuildContext context) {
    setState(() {
      try {
        num1 = int.parse(t1.text);
        num2 = int.parse(t2.text);
        sum = num1 ~/ num2;
      } on IntegerDivisionByZeroException {
        showAlertDialog(context);
      }
    });
  }

  void clear() {
    setState(() {
      sum = 0;
      t1.text = "0";
      t2.text = "0";
    });
  }

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
            Text(
              "Output: $sum",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number 1"),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Number 2"),
              controller: t2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text("+"),
                  onPressed: add,
                  color: Colors.greenAccent,
                  minWidth: 50.0,
                ),
                MaterialButton(
                    child: Text("-"),
                    onPressed: sub,
                    color: Colors.greenAccent,
                    minWidth: 50.0),
                MaterialButton(
                    child: Text("*"),
                    onPressed: multiply,
                    color: Colors.greenAccent,
                    minWidth: 50.0),
                MaterialButton(
                    child: Text("/"),
                    onPressed: () {divide(context);},
                    color: Colors.greenAccent,
                    minWidth: 50.0)
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text("Clear"),
                  onPressed: clear,
                  color: Colors.cyanAccent,
                )
              ],
            ),
          ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
