import 'package:flutter/material.dart';

class Mascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mascot"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/mascot.png"),
            Text(
              "Made by a Crazy Programmer!!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Color(0xffff0000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
