// ignore_for_file: prefer_const_constructors

import 'package:cargo/landing_page.dart';
import 'package:cargo/welcome_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

//Faris commit......
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Home());
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
//This is Hassan Mustafa..
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
//test
