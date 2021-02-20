import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF20BF06),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                new Text("Blogging",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.white)),
                new Padding(
                  padding: new EdgeInsets.only(top: 40.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.white),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: "Valid Email",
                    hintStyle: TextStyle(color: Colors.white),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.white),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: new Text(
                      'Sign Up',
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/MyBlog');
                    },
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    new Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}