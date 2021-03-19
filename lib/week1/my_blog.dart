import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:udacoding_mentoring_flutter/week4/profile.dart';

class MyBlog extends StatefulWidget {
  @override
  _MyBlogState createState() => _MyBlogState();
}

enum statusLogin { signIn, notSignIn }

class _MyBlogState extends State<MyBlog> {
  statusLogin _loginStatus = statusLogin.notSignIn;
  String fullname = "", email = "";

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fullname = sharedPreferences.getString("name");
      email = sharedPreferences.getString("email");
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getDataPref();
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", null);
      sharedPreferences.commit();
      _loginStatus = statusLogin.notSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Your Blogs'),
        backgroundColor: Color(0xFF20BF06),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(fullname),
              accountEmail: new Text(email),
              currentAccountPicture: new CircleAvatar(
                child: Text('?',
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
              decoration: new BoxDecoration(
                color: Color(0xFF20BF06),
              ),
            ),
            // Gallery
            new ListTile(
              leading: new Icon(Icons.photo),
              title: new Text('Gallery Peternakan'),
              onTap: () {
                Navigator.pushNamed(context, '/PageGallery');
              },
            ),
            // Kamus
            new ListTile(
              leading: new Icon(Icons.book),
              title: new Text('Kamus Peternakan'),
              onTap: () {
                Navigator.pushNamed(context, '/PageKamus');
              },
            ),
            // News
            new ListTile(
              leading: new Icon(Icons.article),
              title: new Text('Berita Peternakan'),
              onTap: () {
                Navigator.pushNamed(context, '/PageBerita');
              },
            ),
            // Halaman Hitung Fisika
            new ListTile(
              leading: new Icon(Icons.calculate),
              title: new Text('Hitung Fisika'),
              onTap: () {
                Navigator.pushNamed(context, '/PageHitungFisika');
              },
            ),
            // Halaman Konversi Nilai
            new ListTile(
              leading: new Icon(Icons.track_changes),
              title: new Text('Konversi Nilai'),
              onTap: () {
                Navigator.pushNamed(context, '/PageKonversiNilai');
              },
            ),
            // Halaman Payment
            new ListTile(
              leading: new Icon(Icons.payment),
              title: new Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, '/Payment');
              },
            ),
            // Halaman Logout
            new ListTile(
              leading: new Icon(Icons.person),
              title: new Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Profile(signOut);
                    })
                );

              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CreatePost');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF616161),
      ),
      body: new ListView(
        padding: new EdgeInsets.all(9.0),
        children: [
          new ListTile(
            leading: CircleAvatar(
              child: Text('W', style: TextStyle(color: Colors.white)),
              backgroundColor: Color(0xFF682D27),
              radius: 30.0,
            ),
            title: new Text('What is dart ?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            subtitle: new Text(
                'Dart is a client-optimized programming language for apps on multiple platforms. It is developed...',
                style: TextStyle(fontSize: 13.0)),
            trailing:
                new Text('Jan 26, 2021', style: TextStyle(fontSize: 13.0)),
          ),
          Divider(
            thickness: 1.0,
          ),
          new ListTile(
            leading: CircleAvatar(
              child: Text('W', style: TextStyle(color: Colors.white)),
              backgroundColor: Color(0xFF329A4B),
              radius: 30.0,
            ),
            title: new Text('What is flutter ?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            subtitle: new Text(
                'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for...',
                style: TextStyle(fontSize: 13.0)),
            trailing:
                new Text('Jan 26, 2021', style: TextStyle(fontSize: 13.0)),
          ),
          Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
