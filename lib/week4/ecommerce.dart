import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'crud_ecommerce/add_data_menu.dart';
import 'crud_ecommerce/detail_category_ecommerce.dart';
import 'crud_ecommerce/detail_ecommerce.dart';

class Ecommerce extends StatefulWidget {
  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  List list;
  List listCategoryEcommerce;

  Future<String> getDataEcommerce() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://flutterazhar.herokuapp.com/ecommerce/getEcommerce.php"),
        headers: {"Accept": "application/json"});

    Future.delayed(
      Duration(seconds: 10),
          () => 'Large Latte',
    );

    this.setState(() {
      list = json.decode(response.body);
    });
  }

  Future<String> getDataCategoryEcommerce() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://flutterazhar.herokuapp.com/ecommerce/getCategoryEcommerce.php"),
        headers: {"Accept": "application/json"});

    Future.delayed(
      Duration(seconds: 10),
      () => 'Large Latte',
    );

    this.setState(() {
      listCategoryEcommerce = json.decode(response.body);
    });
  }

  @override
  void initState() {
    this.getDataEcommerce();
    this.getDataCategoryEcommerce();
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
              Tab(text: 'All Ecommerce'),
            ],
          ),
          title: Text('Simple Ecommerce'),
          backgroundColor: Color(0xFF20BF06),
        ),
        floatingActionButton: new FloatingActionButton(
            backgroundColor: Color(0xFF20BF06),
            child: new Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddDataMenu()));
            }),
        body: TabBarView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'Top Ecommerce',
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailEcommerce(list: list, index: index);
                            }));
                          },
                          child: Card(
                            child: Image.network(
                              'https://flutterazhar.herokuapp.com/ecommerce/' +
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
                  'List Category Ecommerce',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: listCategoryEcommerce == null
                        ? 0
                        : listCategoryEcommerce.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailKategoriEcommerce(
                                  listCategoryEcommerce: listCategoryEcommerce,
                                  index: index);
                            }));
                          },
                          child: Card(
                            color: Color(0xFF20BF06),
                            child: Center(
                              child: Text(
                                listCategoryEcommerce[index]['nama'],
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
                  'List All Ecommerce',
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailEcommerce(list: list, index: index);
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
                                'https://flutterazhar.herokuapp.com/ecommerce/' +
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
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listCategoryEcommerce == null
                    ? 0
                    : listCategoryEcommerce.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80.0,
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailKategoriEcommerce(
                              listCategoryEcommerce: listCategoryEcommerce,
                              index: index);
                        }));
                      },
                      child: Card(
                        color: Color(0xFF20BF06),
                        child: Center(
                          child: Text(
                            listCategoryEcommerce[index]['nama'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailEcommerce(list: list, index: index);
                      }));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          list[index]['nama'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        trailing: Image.network(
                          'https://flutterazhar.herokuapp.com/ecommerce/' +
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
