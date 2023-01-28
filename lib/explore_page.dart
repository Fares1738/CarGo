// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:cargo/booked_page.dart';
import 'package:cargo/host_page.dart';
import 'package:cargo/location_page.dart';
import 'package:cargo/rent_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePage createState() => _ExplorePage();
}

class Car {
  String carId, carPicture, carManfacturer, carModel, carMakeYear, carLocation;
  double carRentPrice;
  Car(
      {required this.carId,
      required this.carPicture,
      required this.carManfacturer,
      required this.carModel,
      required this.carMakeYear,
      required this.carLocation,
      required this.carRentPrice});
}

var car1 = Car(
  carId: '123',
  carPicture: 'teslaCar.png',
  carManfacturer: 'Tesla',
  carModel: 'Model X',
  carMakeYear: '2018',
  carLocation: 'Oxford Street',
  carRentPrice: 20,
);
var car2 = Car(
  carId: '123',
  carPicture: 'prado.png',
  carManfacturer: 'Toyota',
  carModel: 'Prado',
  carMakeYear: '2015',
  carLocation: 'Jabra Street',
  carRentPrice: 50,
);

class _ExplorePage extends State<ExplorePage> {
  final List _cars = [
    CarCardSample(car: car1),
    CarCardSample(car: car2),
    CarCardSample(car: car1),
    CarCardSample(car: car2),
  ];
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
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SearchElevatedButton(),
          ),
          Text(
            'Explore Cars Near you!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _cars.length,
            itemBuilder: (context, index) {
              return _cars[index];
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
          height: 100.0,
          width: 100.0,
        ),
      ),
    );
  }

  ElevatedButton SearchElevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Text("Search for a Location"),
      label: Icon(
        Icons.search,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300, 40),
        textStyle: TextStyle(
          fontSize: 15,
        ),
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
      backgroundColor: Colors.white,
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

class CarCardSample extends StatefulWidget {
  const CarCardSample({super.key, required this.car});
  final Car car;
  @override
  State<CarCardSample> createState() => _CarCardSampleState();
}

class _CarCardSampleState extends State<CarCardSample> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.deepPurpleAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(233, 248, 248, 251),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 5),
                              blurRadius: 8.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/${widget.car.carPicture}'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Text(
                            widget.car.carManfacturer,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.car.carModel,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.car.carMakeYear,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            '${widget.car.carRentPrice.round()} RM/hr',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            widget.car.carLocation,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
