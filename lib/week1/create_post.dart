import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create a Post'),
        backgroundColor: Color(0xFF20BF06),
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 5.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Title...",
                    hintStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  maxLines: 15,
                  decoration: new InputDecoration(
                    hintText: "Deskripsi...",
                    hintStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
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
                      'Publish',
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Color(0xFF20BF06),
                    onPressed: () {
                      Navigator.pushNamed(context, '/MyBlog');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}