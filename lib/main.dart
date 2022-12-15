

import 'package:flutter/material.dart';

import 'login_page.dart';
//Faris commit
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Home());
}
//Nafis Ahmed
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
