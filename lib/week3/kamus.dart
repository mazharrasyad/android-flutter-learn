import 'package:flutter/material.dart';
import 'package:udacoding_mentoring_flutter/week3/detail_kamus.dart';

class Kamus extends StatefulWidget {
  @override
  _KamusState createState() => _KamusState();
}

class _KamusState extends State<Kamus> {
  var etSearce = new TextEditingController();
  bool isSearch = true;
  String query = "";
  var dataList = [
    {
      "nama": "Aseptabilitas",
      "keterangan":
          "Aseptabilitas yaitu volume pakan yang diperlukan kambing sangat tergantung dari bobot total badan dan kemamapuan memakan pakan"
    },
    {
      "nama": "Abiotrophy",
      "keterangan":
          "Abiotrophy yaitu kelainan  degeneratif  yang  tidak  disebabkan  oleh faktor  luar  dan terjadi setelah kelahiran, bersifat herediter"
    },
    {
      "nama": "Ablatation",
      "keterangan": "Ablatation yaitu membuang bagian tubuh, misalnya dalam amputasi"
    },
    {
      "nama": "Achromatrichia",
      "keterangan": "Achromatrichia yaitu keadaan tidak ada atau hilangnya pigment pada rambut"
    },
    {
      "nama": "Acidosis",
      "keterangan": "Acidosis yaitu keadaan menurunnya kadar basa dalam darah dan jaringan"
    },
    {
      "nama": "Back Crossing",
      "keterangan": "Back Crossing yaitu perkawinan terhadap hybrid dengan salah satu parent (tertuanya)"
    },
    {
      "nama": "Barley",
      "keterangan": "Barley yaitu Hordeum  sativum,  salah  satu  jenis  makanan  ternak  yang  merupakan sumber karbohidrat, yang banyak digunakan didaerah sub tropik. Kadar energinya bervariasi antara 2300 sampai 2700 kkal ME tiap kg, dengan kadar protein antara 9 sampai 12,5%"
    },
    {
      "nama": "Cafetaria",
      "keterangan": "Cafeteria yaitu suatu  sistem  penempatan  kandang  baterai,  dimana  makan  berputar mengelilingi kandang baterai tersebut"
    },
    {
      "nama": "Calving",
      "keterangan": "Calving yaitu melahirkan (untuk  sapi  dan  kerbau)  Calving  interval:  selang  waktu  2 kelahiran berurutan"
    },
  ];
  List<String> filterList, filterListKeterangan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _KamusState();
  }

  _KamusState() {
    etSearce.addListener(() {
      if (etSearce.text.isEmpty) {
        setState(() {
          isSearch = false;
          query = "";
        });
      } else {
        setState(() {
          isSearch = true;
          query = etSearce.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamus Peternakan'),
        backgroundColor: Color(0xFF20BF06),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _createSearchView(),
            isSearch ? _performSearch() : _createSearchView(),
          ],
        ),
      ),
    );
  }

// membuat form search
  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: TextField(
        controller: etSearce,
        decoration: InputDecoration(
            hintText: "Search", hintStyle: TextStyle(color: Colors.green)),
        textAlign: TextAlign.center,
      ),
    );
  }

// membuat form
  Widget _createListView() {
    return Flexible(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(margin: EdgeInsets.all(10.0)),
            color: Colors.white,
            elevation: 5.0,
          );
        },
      ),
    );
  }

// lakukan search dengan fungsi contains
  Widget _performSearch() {
    filterList = new List<String>();
    filterListKeterangan = new List<String>();
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item["nama"].toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item["nama"]);
        filterListKeterangan.add(item["keterangan"]);
      }
    }
    return _createFilteredListView();
  }

// tampilkan daftar hasil pencarian
  Widget _createFilteredListView() {
    return Flexible(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 5.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailKamus(
                              nama: filterList[index],
                              keterangan: filterListKeterangan[index],
                            )));
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text('${filterList[index]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
