import 'package:flutter/material.dart';

class DetailKamus extends StatefulWidget {
  String nama, keterangan;

  DetailKamus({this.nama, this.keterangan});

  @override
  _DetailKamusState createState() => _DetailKamusState();
}

class _DetailKamusState extends State<DetailKamus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Istilah ${widget.nama}'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: ListView(
        children: [
          BagianKeterangan(
            keterangan: widget.keterangan,
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  String keterangan;

  BagianKeterangan({this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            '$keterangan',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
