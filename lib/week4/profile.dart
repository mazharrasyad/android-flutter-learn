import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final VoidCallback signOut;

  Profile(this.signOut);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  signOut() async {
    setState(() {
      widget.signOut();
    });
  }

  String fullname = "", email = "";

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fullname = sharedPreferences.getString("name");
      email = sharedPreferences.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: new ListView(
          shrinkWrap: true,
          padding: new EdgeInsets.all(20.0),
          children: [
            ListTile(
              title: Center(
                child: CircleAvatar(
                  child: Text('?', style: TextStyle(fontSize: 30, color: Colors.white)),
                  backgroundColor: Color(0xFF682D27),
                  radius: 50,
                ),
              ),
            ),
            ListTile(
              title: Center(
                  child: Text(fullname,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold))),
              subtitle: Center(
                child: Text(email, style: TextStyle(fontSize: 13.0)),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Text(
                'Basic Flutter',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              color: Color(0xFF20BF06),
              onPressed: () {
                Navigator.pushNamed(context, "/MyBlog");
              },
            ),
            Divider(
              thickness: 1.0,
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Text(
                'Book Libarary Apps',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              color: Color(0xFF20BF06),
              onPressed: () {
                Navigator.pushNamed(context, "/Book");
              },
            ),
            Divider(
              thickness: 1.0,
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Text(
                'Simple Ecommerce',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              color: Color(0xFF20BF06),
              onPressed: () {
                Navigator.pushNamed(context, "/Ecommerce");
              },
            ),
            Divider(
              thickness: 1.0,
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Text(
                'Logout',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              color: Color(0xFF20BF06),
              onPressed: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getDataPref();
  }
}
