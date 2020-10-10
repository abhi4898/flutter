import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage diceimage1, diceimage2;

  @override
  void initState() {
    super.initState();
    setState(() {
      diceimage1 = one;
      diceimage2 = two;
    });
  }

  void rollDice1() {
    int random = (1 + Random().nextInt(6));

    AssetImage newImage;

    switch (random) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }
    setState(() {
      diceimage1 = newImage;
    });
  }

  void rollDice2() {
    var random2 = (1 + Random().nextInt(6));

    AssetImage newImage2;

    switch (random2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }
    setState(() {
      diceimage2 = newImage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Roller',
        ),
        backgroundColor: Color(0xffefa602),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: diceimage1,
                    width: 100.0,
                    height: 100.0,
                  ),
                  Image(
                    image: diceimage2,
                    width: 100.0,
                    height: 100.0,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  color: Color(0xffefa602),
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Text(
                    'Roll the dice!',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  onPressed: () {
                    rollDice1();
                    rollDice2();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
