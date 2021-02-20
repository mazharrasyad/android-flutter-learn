import 'package:flutter/material.dart';
import 'package:udacoding_mentoring_flutter/week1/sign_up.dart';
import 'package:udacoding_mentoring_flutter/week1/my_blog.dart';
import 'package:udacoding_mentoring_flutter/week1/create_post.dart';
import 'package:udacoding_mentoring_flutter/week1/payment.dart';
import 'package:udacoding_mentoring_flutter/week2/login.dart';
import 'package:udacoding_mentoring_flutter/week2/home.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sign Up",
      home: new MyApp(),
      routes: <String, WidgetBuilder>{
        '/SignUp': (BuildContext context) => new SignUp(),
        '/MyBlog': (BuildContext context) => new MyBlog(),
        '/CreatePost': (BuildContext context) => new CreatePost(),
        '/Payment': (BuildContext context) => new Payment(),
      }));
}