import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ecommerce.dart';
import 'dart:io';
import 'dart:async';

class AddCategoryEcommerce extends StatefulWidget {
  @override
  _AddCategoryEcommerceState createState() => _AddCategoryEcommerceState();
}

class _AddCategoryEcommerceState extends State<AddCategoryEcommerce> {
  TextEditingController namaController = new TextEditingController();

  void addEcommerce() {
    var url =
        "https://flutterazhar.herokuapp.com/ecommerce/addCategoryEcommerce.php";
    http.post(url, body: {
      "namaKategoriProduk": namaController.text,
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Add Data Kategori Produk'),
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
                        hintText: "Input Nama Kategori Produk",
                        labelText: "Nama Kategori Produk",
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
                    Route route = MaterialPageRoute(builder: (context) => Ecommerce());
                    Navigator.pushReplacement(context, route).then(onGoBack);

                    // setState(() {
                    //   addEcommerce();
                    // });
                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) => Ecommerce()));
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
