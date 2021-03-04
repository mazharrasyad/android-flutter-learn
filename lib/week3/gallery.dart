import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:udacoding_mentoring_flutter/week3/detail_gallery.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  List<Container> daftarHewanPeternakan = new List();
  var itemHewanPeternakan = [
    {
      "nama": "Ayam",
      "gambar": "Ayam.jpg",
      "Keterangan": "Beternak ayam untuk mendapatkan telur dan dagingnya"
    },
    {
      "nama": "Bebek",
      "gambar": "Bebek.jpg",
      "Keterangan": "Beternak bebek untuk mendapatkan telur dan dagingnya"
    },
    {
      "nama": "Kambing",
      "gambar": "Kambing.jpg",
      "Keterangan": "Beternak kambing untuk mendapatkan susu dan dagingnya"
    },
    {
      "nama": "Lele",
      "gambar": "Lele.jpg",
      "Keterangan": "Beternak lele untuk mendapatkan dagingnya"
    },
    {
      "nama": "Sapi",
      "gambar": "Sapi.jpg",
      "Keterangan": "Beternak kambing untuk mendapatkan susu dan dagingnya"
    },
    {
      "nama": "Udang",
      "gambar": "Udang.jpg",
      "Keterangan": "Beternak udang untuk mendapatkan dagingnya"
    },
  ];

  //method
  _buatDataListHewan() async {
    for (var i = 0; i < itemHewanPeternakan.length; i++) {
      final dataHewan = itemHewanPeternakan[i];
      final String gambarHewan = dataHewan["gambar"];
      daftarHewanPeternakan.add(new Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: InkWell(
            onTap: () {
              //pindah ke detail
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  DetailGallery(
                    nama: dataHewan["nama"],
                    gambar: gambarHewan,
                    keterangan: dataHewan["Keterangan"],
                  )));
            },
            child: Column(
              children: [
                Hero(
                  tag: dataHewan["nama"],
                  child: Image.network(
                    'https://flutterazhar.herokuapp.com/$gambarHewan', height: 85.0, width: 125, fit:
                  BoxFit.contain,),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(dataHewan['nama'],
                  style: TextStyle(fontSize: 14.0, fontWeight:
                  FontWeight.bold, color: Colors.deepOrange),)
              ],
            ),
          ),
        ),
      ));
    }
  }

  //proses background
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buatDataListHewan();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gallery'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarHewanPeternakan,
      ),
    );
  }
}
