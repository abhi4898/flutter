// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  navigateToSigninScreen() {
    Navigator.pushReplacementNamed(context, "/SigninPage");
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      try {
        AuthResult user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          UserUpdateInfo updateuser = UserUpdateInfo();
          updateuser.displayName = _name;
          user.user.updateProfile(updateuser);
        }
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      //name
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide a name';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (input) => _name = input,
                        ),
                      ),
                      //email
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide an email';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (input) => _email = input,
                        ),
                      ),
                      //password
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Password should be more than 6 characters!';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: RaisedButton(
                          padding:
                              EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                          onPressed: signup,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: navigateToSigninScreen,
                        child: Text(
                          'Already created a account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
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
