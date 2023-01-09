// ignore_for_file: camel_case_types, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Cars extends StatefulWidget {
  Cars({
    super.key,
    required this.city,
  });

  final Text city;

  @override
  _Cars createState() => _Cars();
}

class _Cars extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CarGoAppBar(),
            body: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Search(),
              ),
              widget.city,
              carCard(),
              carCard2(),
              SizedBox(height: 20),
            ])));
  }

  AppBar CarGoAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Image.asset(
          'assets/CarGo2.png',
          color: Colors.black,
          height: 120.0,
          width: 90.0,
        ),
      ),
    );
  }
}

final userCity = TextEditingController();

@override
void dispose() {
  userCity.dispose();
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: userCity,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Johor Bahru",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ),
    );
  }
}

class carCard extends StatelessWidget {
  const carCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("A car been Clicked...");
      },
      splashColor: Colors.deepPurpleAccent,
      child: Card(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 4),
          elevation: 10,
          child: Column(
            children: <Widget>[
              Image.asset(
                fit: BoxFit.fill,
                'assets/ferrari.jpg',
                // height: 200,
                // width: 350,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Ferrari Portofino M',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 6),
            ],
          )),
    );
  }
}

class carCard2 extends StatelessWidget {
  const carCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("A car been Clicked...");
      },
      splashColor: Colors.deepPurpleAccent,
      child: Card(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 4),
          elevation: 10,
          child: Column(
            children: <Widget>[
              Image.asset(
                fit: BoxFit.fill,
                'assets/mustang.jpg',
                // height: 200,
                // width: 350,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Mustang GT500',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 6),
            ],
          )),
    );
  }
}
