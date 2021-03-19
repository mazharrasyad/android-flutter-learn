import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../ecommerce.dart';
import 'edit_category_ecommerce.dart';
import 'detail_ecommerce.dart';

class DetailKategoriEcommerce extends StatefulWidget {
  List listCategoryEcommerce;
  int index;

  DetailKategoriEcommerce({this.listCategoryEcommerce, this.index});

  @override
  _DetailKategoriEcommerceState createState() =>
      _DetailKategoriEcommerceState();
}

class _DetailKategoriEcommerceState extends State<DetailKategoriEcommerce> {
  Future<List> getData() async {
    final response = await http
        .get("https://flutterazhar.herokuapp.com/ecommerce/getEcommerce.php");
    return json.decode(response.body);
  }

  void deletedata() {
    var url = "https://flutterazhar.herokuapp.com/ecommerce/deleteCategoryEcommerce.php";
    http.post(url,
        body: {'id': widget.listCategoryEcommerce[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah kamu yakin menghapus kategori '${widget.listCategoryEcommerce[widget.index]['nama']}' ?"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              'Ya',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              deletedata();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Ecommerce()));
            }),
        new RaisedButton(
          child: new Text(
            'Tidak',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Kategori " + widget.listCategoryEcommerce[widget.index]['nama']),
        backgroundColor: Color(0xFF20BF06),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return EditCategoryEcommerce(list: widget.listCategoryEcommerce, index: widget.index);
                  }));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirm(),
          ),
        ],
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
                                widget.listCategoryEcommerce[widget.index]
                                    ['id'])
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailEcommerce(list: snapshot.data, index: i);
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
                                      'https://flutterazhar.herokuapp.com/ecommerce/' +
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
