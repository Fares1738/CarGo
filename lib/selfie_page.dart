import 'package:cargo/verify_identity.dart';
import 'package:flutter/material.dart';

import 'explore_page.dart';

class SelfiePage extends StatefulWidget {
  const SelfiePage({Key? key}) : super(key: key);

  @override
  State<SelfiePage> createState() => _SelfiePageState();
}

class _SelfiePageState extends State<SelfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        widget,
              ]),
    );
  }
}
