import 'package:flutter/material.dart';
import 'Category.dart';
import 'HomePage.dart';
import 'Mascot.dart';
import 'Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Category(),
        "/mascot": (BuildContext context) => Mascot(),
        "/profile": (BuildContext context) => Profile(),
      },
    );
  }
}
