import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'I am the first one',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                'I am the second one',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.orange,
                splashColor: Colors.green,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
