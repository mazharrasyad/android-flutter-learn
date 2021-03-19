// Referensi : https://medium.com/@alamsyah15/flutter-dropdown-menu-from-rest-api-aca3ba6dc04d

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ecommerce.dart';
import 'dart:async';
import 'dart:convert';

class AddEcommerce extends StatefulWidget {
  @override
  _AddEcommerceState createState() => _AddEcommerceState();
}

class _AddEcommerceState extends State<AddEcommerce> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController deskripsiController = new TextEditingController();
  String _valCategoryEcommerce;
  List<dynamic> _dataCategoryEcommerce = List();

  void getCategoryEcommerce() async {
    final respose = await http.get("https://flutterazhar.herokuapp.com/ecommerce/getCategoryEcommerce.php");
    var listData = jsonDecode(respose.body);
    setState(() {
      _dataCategoryEcommerce = listData;
    });
    print("data : $listData");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryEcommerce();
  }

  void addEcommerce() {
    var url = "https://flutterazhar.herokuapp.com/ecommerce/addEcommerce.php";
    http.post(url, body: {
      "namaProduk": namaController.text,
      "kategoriProduk": _valCategoryEcommerce,
      "deskripsiProduk": deskripsiController.text,
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Add Data Produk'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: namaController,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Produk",
                        labelText: "Nama Produk",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new DropdownButtonFormField(
                    value: _valCategoryEcommerce,
                    items: _dataCategoryEcommerce.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['nama']),
                        value: item['id'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valCategoryEcommerce = value;
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Input Kategori Produk",
                        labelText: "Kategori Produk",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    maxLines: 5,
                    controller: deskripsiController,
                    decoration: new InputDecoration(
                        hintText: "Input Deskripsi Produk",
                        labelText: "Deskripsi Produk",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text(
                    "Add Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF20BF06),
                  onPressed: () {
                    addEcommerce();
                    Route route =
                        MaterialPageRoute(builder: (context) => Ecommerce());
                    Navigator.pushReplacement(context, route).then(onGoBack);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
