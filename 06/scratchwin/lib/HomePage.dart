import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: import images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  //TODO: get an array
  List<String> itemArray;
  int luckyNumber;
  String message = "You have 5 chances";
  int counter = 0;

  //TODO: init array with 25 elements
  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => 'empty');
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

  //Delay method
  delay() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        this.resetGame();
        counter = 0;
      });
    });
  }

  //TODO: define a getImage method
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  //Display message
  displayMessage() {
    setState(() {
      message = "Only 5 tries! Please try again.";
      delay();
    });
  }

  //TODO: play game method
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
        this.message = "yeah! You got it!";
        delay();
      });
    } else if (luckyNumber != index && counter <= 5) {
      setState(() {
        itemArray[index] = "unlucky";
        counter++;
      });
    }
    if (counter == 5) {
      displayMessage();
    }
  }

  //TODO: show all
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
      delay();
    });
  }

  //TODO: reset all
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      this.message = "You have 5 chances";
      this.counter = 0;
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and Win!!!"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                // width: 0.0,
                // height: 0.0,
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 12.0, 50.0, 12.0),
                color: Color(0xff2f363f),
                child: Text(
                  this.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: RaisedButton(
                    onPressed: () {
                      this.showAll();
                    },
                    color: Colors.pink,
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Text(
                      "show All",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: RaisedButton(
                    onPressed: () {
                      this.resetGame();
                    },
                    color: Colors.pink,
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Text(
                      "Reset All",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            color: Color(0xFF47535E),
            child: Text(
              "Developed by Abhishek!!!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            alignment: Alignment(0.0, 0.0),
          ),
        ],
      ),
    );
  }
}
