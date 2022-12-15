

import 'package:flutter/material.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Home());
}
//Nafis
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
//This is Hassan Mustafa...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
