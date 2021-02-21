import 'package:flutter/material.dart';

class HitungFisika extends StatefulWidget {
  @override
  _HitungFisikaState createState() => _HitungFisikaState();
}

class _HitungFisikaState extends State<HitungFisika> {
  TextEditingController panjang_luas = new TextEditingController();
  TextEditingController lebar_luas = new TextEditingController();
  TextEditingController panjang_volume = new TextEditingController();
  TextEditingController lebar_volume = new TextEditingController();
  TextEditingController tinggi_volume = new TextEditingController();

  String hasil_luas = "0";
  String hasil_volume = "0";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hitung Fisika'),
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
                        controller: panjang_luas,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Panjang (m)",
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(right: 20.0),
                    ),
                    new Flexible(
                      child: new TextField(
                        controller: lebar_luas,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Lebar (m)",
                        ),
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
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: new Text(
                      'Hitung Luas',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Color(0xFF20BF06),
                    onPressed : () {
                      setState(() {
                        double sum = double.parse(panjang_luas.text) * double.parse(lebar_luas.text);
                        hasil_luas = sum.toString();
                      });
                    },
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                new Text("Luas Persegi Panjang : ${hasil_luas} m2", style: TextStyle(fontSize: 18.0),),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                Divider(
                  thickness: 5.0,
                  color: Color(0xFF20BF06),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        controller: panjang_volume,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Panjang (m)",
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(right: 20.0),
                    ),
                    new Flexible(
                      child: new TextField(
                        controller: lebar_volume,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Lebar (m)",
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(right: 20.0),
                    ),
                    new Flexible(
                      child: new TextField(
                        controller: tinggi_volume,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Tinggi (m)",
                        ),
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
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: new Text(
                      'Hitung Volume',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Color(0xFF20BF06),
                    onPressed : () {
                      setState(() {
                        double sum2 = double.parse(panjang_volume.text) * double.parse(lebar_volume.text) * double.parse(tinggi_volume.text);
                        hasil_volume = sum2.toString();
                      });
                    },
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                new Text("Volume Persegi Panjang : ${hasil_volume} m3", style: TextStyle(fontSize: 18.0),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
