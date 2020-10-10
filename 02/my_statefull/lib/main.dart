import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];

  String defaultText = "Spanish numbers";
  String defaultNum = "numeric nums";

  void displayNumbers() {
    setState(() {
      defaultText = spanishNumbers[counter];
      defaultNum = (counter + 1).toString();

      if (counter < 9) {
        counter += 1;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stateful App'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText, style: TextStyle(fontSize: 30.0)),
              Text(
                defaultNum,
                style: TextStyle(fontSize: 30.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text(
                  'Call numbers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: displayNumbers,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
