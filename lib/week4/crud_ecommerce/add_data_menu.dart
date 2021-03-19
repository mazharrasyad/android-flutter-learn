import 'package:flutter/material.dart';
import 'add_category_ecommerce.dart';
import 'add_ecommerce.dart';

class AddDataMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Tambah Data'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: ListView(
        padding: new EdgeInsets.all(20.0),
        children: <Widget>[
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: new Text(
              'Tambah Data Kategori',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            color: Color(0xFF20BF06),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddCategoryEcommerce()));
            },
          ),
          Divider(
            thickness: 1.0,
          ),
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: new Text(
              'Tambah Data Produk',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            color: Color(0xFF20BF06),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddEcommerce()));
            },
          ),
        ],
      ),
    );
  }
}