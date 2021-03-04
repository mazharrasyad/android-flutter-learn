import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  Future<List> getData() async {
    final response = await
    http.get("https://flutterazhar.herokuapp.com/get_berita.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Berita Peternakan'),
          backgroundColor: Color(0xFF20BF06),
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) {
                return DetailBerita(list, index);
              }));
            },
            child: Card(
              child: ListTile(
                title: Text(
                  list[index]['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color:
                  Colors.black),
                ),
                subtitle: Text("Tanggal : ${list[index]['date']}"),
                  trailing: Image.network(
                  'https://flutterazhar.herokuapp.com/' +
                  list[index]['photo'],
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailBerita extends StatelessWidget {
  List list;
  int index;

  DetailBerita(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]['title']),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: ListView(
        children: <Widget>[
          Image.network('https://flutterazhar.herokuapp.com/' +
              list[index]['photo']),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(list[index]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Text(list[index]['date'])
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.black,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Text(list[index]['description'], softWrap: true,),
          )
        ],
      ),
    );
  }
}

