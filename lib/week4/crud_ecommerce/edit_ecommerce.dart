import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ecommerce.dart';

class EditEcommerce extends StatefulWidget {
  final List list;
  final int index;

  EditEcommerce({this.list, this.index});

  @override
  _EditEcommerceState createState() => _EditEcommerceState();
}

class _EditEcommerceState extends State<EditEcommerce> {
  TextEditingController namaController;
  TextEditingController kategoriController;
  TextEditingController deskripsiController;

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

  void editData() {
    var url =
        "http://flutterazhar.herokuapp.com/ecommerce/editEcommerce.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "namaProduk": namaController.text,
      "kategoriProduk": _valCategoryEcommerce,
      "deskripsiProduk": deskripsiController.text
    });
  }

  @override
  void initState() {
    namaController = new TextEditingController(text: widget.list[widget.index]['nama']);
    _valCategoryEcommerce = widget.list[widget.index]['kategori'];
    deskripsiController = new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    super.initState();
    getCategoryEcommerce();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Ecommerce'),
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
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
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
                  controller: deskripsiController,
                  decoration: new InputDecoration(
                      hintText: "Input Deskripsi Produk",
                      labelText: "Deskripsi Produk",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new RaisedButton(
                  child: new Text('Edit Data', style: TextStyle(color: Colors.white),),
                  color: Color(0xFF20BF06),
                  onPressed: () {
                    editData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new Ecommerce()));
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
