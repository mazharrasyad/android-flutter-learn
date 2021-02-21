import 'package:flutter/material.dart';

class MyBlog extends StatefulWidget {
  final String nama;
  final String password;

  //constructor

  MyBlog({Key key, @required this.nama, @required this.password})
      : super(key: key);

  @override
  _MyBlogState createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
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
              accountName: new Text('udacodingid'),
              accountEmail: new Text('udacodingid@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                child: Text('U', style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
              decoration: new BoxDecoration(
                color: Color(0xFF20BF06),
              ),
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
              leading: new Icon(Icons.logout),
              title: new Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/PageLogin');
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
            title: new Text('What is dart ?', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            subtitle: new Text('Dart is a client-optimized programming language for apps on multiple platforms. It is developed...', style: TextStyle(fontSize: 13.0)),
            trailing: new Text('Jan 26, 2021', style: TextStyle(fontSize: 13.0)),
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
            title: new Text('What is flutter ?', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            subtitle: new Text('Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for...', style: TextStyle(fontSize: 13.0)),
            trailing: new Text('Jan 26, 2021', style: TextStyle(fontSize: 13.0)),
          ),
          Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}