// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:cargo/booked_page.dart';
import 'package:cargo/host_page.dart';
import 'package:cargo/location_page.dart';
import 'package:cargo/rent_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'DELETEAFTERWARDS.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePage createState() => _ExplorePage();
}

class _ExplorePage extends State<ExplorePage> {
  final List _cars = [carCard(), carCard(), oldCarCard()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CarGoAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SearchElevatedButton(),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _cars.length,
            itemBuilder: (context, index) {
              return carCard();
            },
          ))
        ],
      ),
      bottomNavigationBar: CarGoCurvedNavigationBar(),
    ));
  }

  AppBar CarGoAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Image.asset(
          'assets/CarGo2.png',
          color: Colors.black,
          height: 120.0,
          width: 85.0,
        ),
      ),
    );
  }

  ElevatedButton SearchElevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cities()),
        );
      },
      icon: Text("Search for a Location"),
      label: Icon(
        Icons.search,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300, 40),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.black)),
      ),
    );
  }

  CurvedNavigationBar CarGoCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 0,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      color: Colors.deepPurple,
      animationDuration: Duration(milliseconds: 200),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExplorePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hostpage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeletePage()),
            );
            break;
        }
      },
      items: const [
        Icon(Icons.explore, color: Colors.white),
        Icon(Icons.directions_car_sharp, color: Colors.white),
        Icon(Icons.car_rental, color: Colors.white),
        Icon(Icons.settings, color: Colors.white),
      ],
    );
  }
}

class oldCarCard extends StatelessWidget {
  const oldCarCard({super.key});

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
                'assets/teslaCar.png',
                // height: 200,
                // width: 350,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Tesla Model X',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 6),
            ],
          )),
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
                'assets/teslaCar.png',
                // height: 200,
                // width: 350,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Tesla Model X',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 6),
            ],
          )),
    );
  }
}
