import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../ecommerce.dart';
import 'edit_ecommerce.dart';

class DetailEcommerce extends StatefulWidget {
  List list;
  int index;

  DetailEcommerce({this.list, this.index});

  @override
  _DetailEcommerceState createState() => _DetailEcommerceState();
}

class _DetailEcommerceState extends State<DetailEcommerce> {
  void deletedata() {
    var url =
        "https://flutterazhar.herokuapp.com/ecommerce/deleteEcommerce.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah kamu yakin menghapus produk '${widget.list[widget.index]['nama']}' ?"),
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
        title: Text(widget.list[widget.index]['nama']),
        backgroundColor: Color(0xFF20BF06),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return EditEcommerce(list: widget.list, index: widget.index);
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirm(),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.network('https://flutterazhar.herokuapp.com/ecommerce/' +
              widget.list[widget.index]['gambar']),
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
                          widget.list[widget.index]['nama'],
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
              widget.list[widget.index]['deskripsi'],
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
