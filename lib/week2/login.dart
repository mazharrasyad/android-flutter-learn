// Referensi : https://medium.com/flutter-developer-indonesia/membuat-aplikasi-form-login-dan-validation-sederhana-pada-flutter-b695a4d5f9d5

import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azhar Task 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        errorColor: Colors.yellowAccent,
      ),
      home: PageLogin(),
    );
  }
}

class PageLogin extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF20BF06),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(top: 100.0),
                  ),
                  new Text("Udacoding Task 3",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: Colors.white)),
                  new Padding(
                    padding: new EdgeInsets.only(top: 40.0),
                  ),
                  new TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                    controller: myUsernameController,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      enabledBorder: new OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                        new BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 15.0),
                  ),
                  new TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if(value.length < 6){
                        return 'Password tidak boleh kurang dari 6 digit';
                      }
                      return null;
                    },
                    controller: myPasswordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      enabledBorder: new OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                        new BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 20.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: new Text(
                        'Login',
                        style:
                        TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        nUsername = myUsernameController.text;
                        nPassword = myPasswordController.text;

                        if (_formKey.currentState.validate()) {
                          if (nUsername != 'udacodingid' &&
                              nPassword != 'udacodingJaya2021') {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Username atau Password Salah'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageHome(
                                      nama: nUsername,
                                      password: nPassword,
                                    )));
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}