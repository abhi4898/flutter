import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final name, email, password, mobile, collegename;

  HomePage({
    Key key,
    @required this.name,
    this.email,
    this.password,
    this.mobile,
    this.collegename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students info"),
      ),
      body: Form(
        child: Card(
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 100.0,
                height: 100.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                ),
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text(
                  mobile,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.school,
                ),
                title: Text(
                  collegename,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
