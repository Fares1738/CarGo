import 'package:cargo/model/CarBooking.dart';
import 'package:cargo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cargo/services/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'HostCarTile.dart';
import 'carBookingsCarsTile.dart';
import 'car_tile.dart';
import 'model/Cars.dart';

class CarBookingsCarsList extends StatefulWidget {
  const CarBookingsCarsList({super.key, required this.carBooking});

  final CarBooking carBooking;
  @override
  State<CarBookingsCarsList> createState() => CarBookingsCarListState();
}

class CarBookingsCarListState extends State<CarBookingsCarsList> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<Cars>?>(context) ?? [];

    print("----------CAR BOOKIN CARS LIST----------");
    // print("String Object Car Id: " + carId);
    print("String Booking Car Id: " + widget.carBooking.carId);
    print("String Cars: " + cars.toString());
    // if (cars != null) {
    // cars.forEach((car) {
    //   print(car.manufacturer);
    //   print(car.makeyear);
    //   print(car.model);
    // });
    // }
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return CarBookingsCarsTile(
                  car: cars[index], carBooking: widget.carBooking);
            },
          ),
        ],
      ),
    );
  }
}
