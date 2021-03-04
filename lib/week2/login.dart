import 'package:flutter/material.dart';
import 'package:udacoding_mentoring_flutter/week1/my_blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

enum statusLogin { signIn, notSignIn }

class _PageLoginState extends State<PageLogin> {
  statusLogin _loginStatus = statusLogin.notSignIn;
  final _keyForm = GlobalKey<FormState>();
  String nUsername, nPassword;

// check ketika klik tombol login
  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataLogin();
    }
  }

  // mengirim request dan menanggapinya
  submitDataLogin() async {
    final responseData =
        await http.post("https://flutterazhar.herokuapp.com/login.php", body: {
      "username": nUsername,
      "password": nPassword,
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    print(data);
// get data respon
    String dataFullname = data['name'];
    String dataEmail = data['email'];
// cek value 1 atau 0
    if (value == 1) {
      setState(() {
// set status loginnya sebagai login
        _loginStatus = statusLogin.signIn;
// simpan data ke share preferences
        saveDataPref(value, dataFullname, dataEmail);
      });
    } else if (value == 2) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Username Telah Digunakan'),
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
    }
  }

// method untuk soimpan share pref
  saveDataPref(int value, String dFullName, String dEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("name", dFullName);
      sharedPreferences.setString("email", dEmail);
    });
  }

  ///
  /// method ini digunakan untuk mengecek apakah user sudah login atau belum
  /// jika sudah set valuenya
  ///
  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      int nvalue = sharedPreferences.getInt("value");
      _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

//method untuk sign out
  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", null);
      sharedPreferences.commit();
      _loginStatus = statusLogin.notSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(
          backgroundColor: Color(0xFF20BF06),
          body: Form(
            key: _keyForm,
            child: new ListView(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(20.0),
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.only(top: 80.0),
                      ),
                      new Text("Udacoding",
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
                        onSaved: (value) => nUsername = value,
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
                          } else if (value.length < 6) {
                            return 'Password tidak boleh kurang dari 6 digit';
                          }
                          return null;
                        },
                        obscureText: true,
                        onSaved: (value) => nPassword = value,
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
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.blueAccent),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              checkForm();
                            });
                          },
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 15.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                            'Don\'t have an account? ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          new GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/SignUp");
                            },
                            child: new Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return MyBlog(signOut);
        break;
    }
  }
}
