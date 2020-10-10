import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, email, password, mobile, collegename;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            color: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter a Password";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (input) => password = input,
                    obscureText: true,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Mobile No.';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Mobile",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter College Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "College Name",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (input) => collegename = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.red[400],
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      //saves to the Global key
      _key.currentState.save();
      //Sends to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: name,
            mobile: mobile,
            password: password,
            email: email,
            collegename: collegename,
          ),
        ),
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
