import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Abhishek",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "abhishekrajavpy@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text(
                  "AK",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff0000),
                ),
              ),
              trailing: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff0000),
                ),
              ),
              trailing: Icon(
                Icons.category,
                color: Colors.black,
              ),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff0000),
                ),
              ),
              trailing: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              onTap: () => Navigator.of(context).pushNamed("/profile"),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Mascot",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff0000),
                ),
              ),
              trailing: Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.black,
              ),
              onTap: () => Navigator.of(context).pushNamed("/mascot"),
            ),
            ListTile(
              title: Text(
                "Close",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff0000),
                ),
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Home Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.home),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
