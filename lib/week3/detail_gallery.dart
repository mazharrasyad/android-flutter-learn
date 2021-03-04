import 'package:flutter/material.dart';

class DetailGallery extends StatefulWidget {
  String nama, gambar, keterangan;

  DetailGallery({this.nama, this.gambar, this.keterangan});

  @override
  _DetailGalleryState createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nama}'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: ListView(
        children: [
          Container(
            height: 240.0,
            child: Hero(
              tag: widget.nama,
              child: Material(
                child: InkWell(
                  child: Image.network(
                    'https://flutterazhar.herokuapp.com/${widget.gambar}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          BagianNama(
            nama: widget.nama,
          ),
          BagianKeterangan(
            keterangan: widget.keterangan,
          )
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});

  String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          new Padding(
            padding: new EdgeInsets.only(left: 10.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 40.0,
                color: Colors.deepOrange,
              ),
            ],
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
