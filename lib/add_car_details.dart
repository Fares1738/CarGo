// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:cargo/host_page.dart';
import 'package:flutter/material.dart';
import 'package:cargo/landing_page.dart';
import 'car_details.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<StatefulWidget> createState() => AddVehicleState();
}

class AddVehicleState extends State<AddVehicle> {
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final makeyear = TextEditingController();
  final mileage = TextEditingController();
  final gasConsumption = TextEditingController();
  final rentPrice = TextEditingController();
  final licenseNumber = TextEditingController();
  final wheelDrive = TextEditingController();
  final seats = TextEditingController();
  final transmission = TextEditingController();
  final location = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    manufacturer.dispose();
    model.dispose();
    makeyear.dispose();
    mileage.dispose();
    gasConsumption.dispose();
    rentPrice.dispose();
    licenseNumber.dispose();
    wheelDrive.dispose();
    seats.dispose();
    transmission.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Transparent appbar and back button icon
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hostpage()),
            );
          })),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),

              Image.asset(
                'assets/CarGo2.png',
                width: 270,
                height: 100,
              ),

              SizedBox(height: 10),

              Text(
                'Add your car details',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              //Manufacturer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: manufacturer,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Manufacturer",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Model
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: model,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Model",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Make Year
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: makeyear,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Make year",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Mileage
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: mileage,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mileage (In KM)",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Gas Consumption
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: gasConsumption,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Gas Consumption (In KM/L)",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Rent Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: rentPrice,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Rent Price per Hour (RM)",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //License Plate Number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: licenseNumber,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "License Plate Number",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Wheel Drive
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: wheelDrive,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Front Wheel/All wheel drive",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Number of Seats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: seats,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Number of seats",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Transmission
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: transmission,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Transmission (Manual/Auto)",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: location,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Location",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Add Vehicle Pictures
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        textStyle: TextStyle(fontSize: 21),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Add Car Pictures'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LandingPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //Add Vehicle button
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        textStyle: TextStyle(fontSize: 21),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Add Car'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewAddedVehicle(
                                    manufacturer: Text(manufacturer.text),
                                    model: Text(model.text),
                                    makeyear: Text(makeyear.text),
                                    mileage: Text(mileage.text),
                                    gasConsumption: Text(gasConsumption.text),
                                    rentPrice: Text(rentPrice.text),
                                    licenseNumber: Text(licenseNumber.text),
                                    wheelDrive: Text(wheelDrive.text),
                                    seats: Text(seats.text),
                                    transmission: Text(transmission.text),
                                    location: Text(location.text))));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        )),
      ),
    );
  }
}
