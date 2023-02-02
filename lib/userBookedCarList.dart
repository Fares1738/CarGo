import 'package:cargo/model/CarBooking.dart';
import 'package:cargo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cargo/services/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'userBookedCarTile.dart';
import 'car_tile.dart';
import 'model/Cars.dart';

class UserBookedCarList extends StatefulWidget {
  const UserBookedCarList({super.key});

  @override
  State<UserBookedCarList> createState() => _UserBookedCarListState();
}

class _UserBookedCarListState extends State<UserBookedCarList> {
  @override
  Widget build(BuildContext context) {
    final carBooking = Provider.of<List<CarBooking>?>(context) ?? [];

    // if (cars != null) {
    // cars.forEach((car) {
    //   print(car.manufacturer);
    //   print(car.makeyear);
    //   print(car.model);
    // });
    // }
    return ListView.builder(
      itemCount: carBooking.length,
      itemBuilder: (context, index) {
        return UserBookedCarTile(carBooking: carBooking[index]);
      },
    );
  }
}
