import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cFullName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  String nUsername, nFullName, nEmail, nPassword;

  final _keyForm = GlobalKey<FormState>();

// saat user klik tombol register
  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataRegister();
    }
  }

  // submit data register
  submitDataRegister() async {
    final responseData = await http
        .post("https://flutterazhar.herokuapp.com/register.php", body: {
      "username": nUsername,
      "name": nFullName,
      "email": nEmail,
      "password": nPassword,
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
        return showDialog<void>(
          context: context,
          barrierDismissible: false,
          // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Register Berhasil'),
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
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20BF06),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(top: 30.0),
                  ),
                  new Text("Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.white)),
                  new Padding(
                    padding: new EdgeInsets.only(top: 40.0),
                  ),
                  new TextFormField(
                    controller: cFullName,
                    validator: (value){//cek kalau value nya kosong
                      if(value.isEmpty){
                        return 'Isi Nama Lengkap Anda';
                      }
                      return null;
                    },
                    onSaved: (value)=>nFullName = cFullName.text,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "Full Name",
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
                    controller: cEmail,
                    validator: (value){//cek kalau value nya kosong
                      if(value.isEmpty){
                        return 'Isi Email Anda';
                      }
                      return null;
                    },
                    onSaved: (value)=> nEmail = cEmail.text,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: "Valid Email",
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
                    controller: cUsername,
                    validator: (value){//cek kalau value nya kosong
                      if(value.isEmpty){
                        return 'Isi Username Anda';
                      }
                      return null;
                    },
                    onSaved: (value)=>nUsername = cUsername.text,

                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.verified_user, color: Colors.white),
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
                    controller: cPassword,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Isi Password Anda';
                      } else if (value.length < 6) {
                        return 'Password tidak boleh kurang dari 6 digit';
                      }
                      return null;
                    },
                    onSaved: (value)=> nPassword = cPassword.text,
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
                    padding: new EdgeInsets.only(top: 15.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: new Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.blueAccent),
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
                        'Already have an account? ',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      new GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/PageLogin");
                        },
                        child: new Text(
                          'Login',
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
  }
}
