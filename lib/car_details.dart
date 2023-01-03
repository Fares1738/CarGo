// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this

import 'package:cargo/add_car_details.dart';
import 'package:cargo/host_page.dart';
import 'package:flutter/material.dart';

class ViewAddedVehicle extends StatefulWidget {
  final List<Text> vehicle = <Text>[];

  ViewAddedVehicle({
    super.key,
    required this.manufacturer,
    required this.model,
    required this.makeyear,
    required this.gasConsumption,
    required this.mileage,
    required this.rentPrice,
    required this.licenseNumber,
    required this.wheelDrive,
    required this.seats,
    required this.transmission,
    required this.location,
  });
  final Text manufacturer;
  final Text model;
  final Text makeyear;
  final Text gasConsumption;
  final Text mileage;
  final Text rentPrice;
  final Text licenseNumber;
  final Text wheelDrive;
  final Text seats;
  final Text transmission;
  final Text location;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => ViewAddedVehicleState();
}

class ViewAddedVehicleState extends State<ViewAddedVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Transparent appbar and back button icon
      extendBodyBehindAppBar: true,
      appBar: CarGoAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              SizedBox(height: 10),
              Text(
                'Confirm Car Details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Manufacturer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.manufacturer,
                    SizedBox(height: 8),
                    Text("Model",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.model,
                    SizedBox(height: 8),
                    Text("Make Year",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.makeyear,
                    SizedBox(height: 8),
                    Text("Gas Consumption",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.gasConsumption,
                    SizedBox(height: 8),
                    Text("Mileage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.mileage,
                    SizedBox(height: 8),
                    Text("Rent Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.rentPrice,
                    SizedBox(height: 8),
                    Text("License Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.licenseNumber,
                    SizedBox(height: 8),
                    Text("Wheel Drive",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.wheelDrive,
                    SizedBox(height: 8),
                    Text("Number of seats",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.seats,
                    SizedBox(height: 8),
                    Text("Transmission",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.transmission,
                    SizedBox(height: 8),
                    Text("Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.location,
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        textStyle: TextStyle(fontSize: 21),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Hostpage()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  AppBar CarGoAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
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
