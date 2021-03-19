import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ecommerce.dart';

class EditCategoryEcommerce extends StatefulWidget {
  final List list;
  final int index;

  EditCategoryEcommerce({this.list, this.index});

  @override
  _EditCategoryEcommerceState createState() => _EditCategoryEcommerceState();
}

class _EditCategoryEcommerceState extends State<EditCategoryEcommerce> {
  TextEditingController namaController;

  void editData() {
    var url =
        "http://flutterazhar.herokuapp.com/ecommerce/editCategoryEcommerce.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "namaCategoryEcommerce": namaController.text
    });
  }

  @override
  void initState() {
    namaController =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Category Ecommerce'),
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
                      hintText: "Input Nama Category Ecommerce",
                      labelText: "Nama Category Ecommerce",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new RaisedButton(
                  child: new Text('Edit Data', style: TextStyle(color: Colors.white),),
                  color: Color(0xFF20BF06),
                  onPressed: () {
                    editData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new Ecommerce()));
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
