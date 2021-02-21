import 'package:flutter/material.dart';

class KonversiNilai extends StatefulWidget {
  @override
  _KonversiNilaiState createState() => _KonversiNilaiState();
}

class _KonversiNilaiState extends State<KonversiNilai> {
  TextEditingController nilai = new TextEditingController();
  double hasil = 0;

  String _valSatuan, _valSatuan2;
  List _listSatuan = [
    'Kilometer',
    'Hektometer',
    'Dekameter',
    'Meter',
    'Desimeter',
    'Centimeter',
    'Milimeter'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Konversi Nilai'),
        backgroundColor: Color(0xFF20BF06),
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 5.0),
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        controller: nilai,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Masukkan Nilai",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    new Flexible(
                      child: new DropdownButtonFormField(
                        hint: Text("Satuan"),
                        value: _valSatuan,
                        items: _listSatuan.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valSatuan = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                        child: new DropdownButtonFormField(
                          hint: Text("Konversi Ke Satuan"),
                          value: _valSatuan2,
                          items: _listSatuan.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valSatuan2 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: new Text(
                      'Konversi',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Color(0xFF20BF06),
                    onPressed : () {
                      setState(() {
                        if (_valSatuan == null || _valSatuan2 == null){
                          hasil = 0;
                        } else if (_valSatuan == _valSatuan2){
                          hasil = double.parse(nilai.text) * 1;
                        } else{
                          var posisi = 0;
                          var posisi2 = 0;
                          var status = "";
                          double temp = 1;

                          // Posisi _valSatuan
                          for (var i = 0; i < _listSatuan.length; i++) {
                            if (_listSatuan[i] == _valSatuan){
                              posisi = i;
                              break;
                            }
                          }

                          // Posisi _valSatuan2
                          for (var i = 0; i < _listSatuan.length; i++) {
                            if (_listSatuan[i] == _valSatuan2){
                              posisi2 = i;
                              break;
                            }
                          }

                          if (posisi < posisi2){
                            status = "Perkalian";
                          } else{
                            status = "Pembagian";
                          }

                          if(status == "Perkalian"){
                            // Menghitung _valSatuan Perkalian
                            for (var i = posisi; i < _listSatuan.length; i++) {
                              if (_listSatuan[i] == _valSatuan2){
                                break;
                              }
                              temp *= 10;
                            }
                          } else {
                            // Menghitung _valSatuan Pembagian
                            for (var i = posisi; i < _listSatuan.length; i--) {
                              if (_listSatuan[i] == _valSatuan2){
                                break;
                              }
                              temp /= 10;
                            }
                          }
                          hasil = double.parse(nilai.text) * temp;
                        }
                      });
                    },
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                new Text("Hasil Konversi : ${hasil}", style: TextStyle(fontSize: 18.0),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
