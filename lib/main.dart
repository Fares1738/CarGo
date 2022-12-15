import 'package:flutter/material.dart';

import 'login_page.dart';

//Faris commit......
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Home());
}

//Nafis Ahmed
//Faris ismail
//Hassan Mustafa

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
