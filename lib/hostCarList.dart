import 'package:cargo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cargo/services/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'HostCarTile.dart';
import 'car_tile.dart';
import 'model/Cars.dart';

class HostCarList extends StatefulWidget {
  const HostCarList({super.key});

  @override
  State<HostCarList> createState() => _HostCarListState();
}

class _HostCarListState extends State<HostCarList> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<Cars>?>(context) ?? [];

    // if (cars != null) {
    // cars.forEach((car) {
    //   print(car.manufacturer);
    //   print(car.makeyear);
    //   print(car.model);
    // });
    // }
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        // AuthService auth = AuthService();
        // final String userId = auth.getUserId();

        // for (var car in cars) {
        //   print('##########');
        //   print("userId: $userId");
        //   print("carHostId: ${car.carHostId}");
        //   print("Item Builder Car Index: ${cars[index].carHostId}");
        //   print('##########');
        //   // if (car.carHostId == userId) {
        //   //   return HostCarTile(car: car);
        //   // }
        // }
        // print('##########');
        // print(userId);
        // print(cars[index].carHostId);
        // print('##########');

        // int status = userId.compareTo(cars[index].carHostId);
        // print("Status: $status");

        return HostCarTile(car: cars[index]);
      },
    );
  }
}
