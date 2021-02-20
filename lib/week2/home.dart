import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  final String nama;
  final String password;

  //constructor

  PageHome({Key key, @required this.nama, @required this.password})
      : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
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
              accountName: new Text('${widget.nama}'),
              accountEmail: new Text('udacodingid@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                child: Text('A', style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
              decoration: new BoxDecoration(
                color: Color(0xFF20BF06),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.logout),
              title: new Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/SignUp');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
        ],
      ),
    );
  }
}

// class _PageHomeState extends State<PageHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page Home'),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView(
//         children: <Widget>[
//           Text('Welcome : ${widget.nama}'),
//           Text('Your Password is : ' + widget.password)
//         ],
//       ),
//     );
//   }
// }
