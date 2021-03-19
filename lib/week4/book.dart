import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  List list;
  List listCategoryBook;

  Future<String> getDataBook() async {
    var response = await http.get(
        Uri.encodeFull("https://flutterazhar.herokuapp.com/book/getBook.php"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      list = json.decode(response.body);
    });
  }

  Future<String> getDataCategoryBook() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://flutterazhar.herokuapp.com/book/getCategoryBook.php"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      listCategoryBook = json.decode(response.body);
    });
  }

  @override
  void initState() {
    this.getDataBook();
    this.getDataCategoryBook();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Category'),
              Tab(text: 'All Book'),
            ],
          ),
          title: Text('Data Book Library Apps'),
          backgroundColor: Color(0xFF20BF06),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'Top Book',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: list == null ? 0 : list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailBuku(list, index);
                            }));
                          },
                          child: Card(
                            child: Image.network(
                              'https://flutterazhar.herokuapp.com/book/' +
                                  list[index]['gambar'],
                              fit: BoxFit.cover,
                              width: 150.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'List Category Book',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount:
                        listCategoryBook == null ? 0 : listCategoryBook.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailKategoriBuku(
                                  listCategoryBook, index);
                            }));
                          },
                          child: Card(
                            color: Color(0xFF20BF06),
                            child: Center(
                              child: Text(
                                listCategoryBook[index]['nama'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'List All Book',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list == null ? 0 : list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailBuku(list, index);
                          }));
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              list[index]['nama'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            trailing: Image.network(
                              'https://flutterazhar.herokuapp.com/book/' +
                                  list[index]['gambar'],
                              fit: BoxFit.cover,
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
            ListView.builder(
              itemCount: listCategoryBook == null ? 0 : listCategoryBook.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80.0,
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailKategoriBuku(listCategoryBook, index);
                      }));
                    },
                    child: Card(
                      color: Color(0xFF20BF06),
                      child: Center(
                        child: Text(
                          listCategoryBook[index]['nama'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DetailBuku(list, index);
                          }));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          list[index]['nama'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        trailing: Image.network(
                          'https://flutterazhar.herokuapp.com/book/' +
                              list[index]['gambar'],
                          fit: BoxFit.cover,
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DetailBuku extends StatelessWidget {
  List list;
  int index;

  DetailBuku(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]['nama']),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: ListView(
        children: <Widget>[
          Image.network('https://flutterazhar.herokuapp.com/book/' +
              list[index]['gambar']),
          Container(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          list[index]['nama'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 16.0),
            child: Text(
              list[index]['deskripsi'],
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}

class DetailKategoriBuku extends StatelessWidget {
  List listCategoryBook;
  int index;

  Future<List> getData() async {
    final response =
        await http.get("https://flutterazhar.herokuapp.com/book/getBook.php");
    return json.decode(response.body);
  }

  DetailKategoriBuku(this.listCategoryBook, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori " + listCategoryBook[index]['nama']),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (context, i) {
                    return new Container(
                        padding: EdgeInsets.all(10.0),
                        child: (snapshot.data[i]['kategori'] ==
                                listCategoryBook[index]['id'])
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailBuku(snapshot.data, i);
                                  }));
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data[i]['nama'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    trailing: Image.network(
                                      'https://flutterazhar.herokuapp.com/book/' +
                                          snapshot.data[i]['gambar'],
                                      fit: BoxFit.cover,
                                      width: 60.0,
                                      height: 60.0,
                                    ),
                                  ),
                                ),
                              )
                            : Container());
                  })
              : Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
