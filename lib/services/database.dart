import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/Cars.dart';

class DatabaseService {
  //Collection Reference

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference carCollection =
      FirebaseFirestore.instance.collection('cars');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  final CollectionReference bookedCarsCollection =
      FirebaseFirestore.instance.collection('carBooking');

//to Store the registered user information so later it can be modified
  Future updateUserData(
      String userFullname, String userEmail, String userPassword) async {
    return await usersCollection.doc(uid).set({
      'userFullname': userFullname,
      'userEmail': userEmail,
      'userPassword': userPassword,
    });
  }

  Future carDetailsCollection(
      String manufacturer,
      String model,
      int makeyear,
      int mileage,
      int gasConsumption,
      int rentPrice,
      String licenseNumber,
      String location,
      String city,
      String transmission,
      int seats,
      int hoursRented,
      int timesRented,
      String imageUrl) async {
    return await carCollection.doc(uid).set({
      'manufacturer': manufacturer,
      'model': model,
      'makeyear': makeyear,
      'mileage': mileage,
      'gasConsumption': gasConsumption,
      'rentPrice': rentPrice,
      'licenseNumber': licenseNumber,
      'location': location,
      'city': city,
      'transmission': transmission,
      'seats': seats,
      'hoursRented': hoursRented,
      'timesRented': timesRented,
      'imageUrl': imageUrl
    });
  }

  Future updateBookedCarsCollection(
      String carId,
      String userId,
      String hostId,
      String bookingStartDate,
      String bookingEndDate,
      String bookingStatus) async {
    return await usersCollection.doc(uid).set({
      'carId': carId,
      'userId': userId,
      'hostId': hostId,
      'bookingStartDate': bookingStartDate,
      'bookingEndDate': bookingEndDate,
      'bookingStatus': bookingStatus,
    });
  }

  // car list
  List<Cars> _carListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((d) {
        return Cars(
          manufacturer: d.data().toString().contains('manufacturer')
              ? d.get('manufacturer')
              : '' "",
          model: d.data().toString().contains('model') ? d.get('model') : '' "",
          makeyear:
              d.data().toString().contains('makeyear') ? d.get('makeyear') : 0,
          mileage:
              d.data().toString().contains('mileage') ? d.get('mileage') : 0,
          gasConsumption: d.data().toString().contains('gasConsumption')
              ? d.get('gasConsumption')
              : 0,
          rentPrice: d.data().toString().contains('rentPrice')
              ? d.get('rentPrice')
              : 0,
          licenseNumber: d.data().toString().contains('licenseNumber')
              ? d.get('licenseNumber')
              : '' "",
          location: d.data().toString().contains('location')
              ? d.get('location')
              : '' "",
          city: d.data().toString().contains('city') ? d.get('city') : '' "",
          wheelDrive: d.data().toString().contains('wheelDrive')
              ? d.get('wheelDrive')
              : '' "",
          transmission: d.data().toString().contains('transmission')
              ? d.get('transmission')
              : '' "",
          seats: d.data().toString().contains('seats') ? d.get('seats') : 0,
          hoursRented: d.data().toString().contains('hoursRented')
              ? d.get('hoursRented')
              : 0,
          timesRented: d.data().toString().contains('timesRented')
              ? d.get('timesRented')
              : 0,
          imageUrl: d.data().toString().contains('imageUrl')
              ? d.get('imageUrl')
              : '' "",
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Stream<List<Cars>> get cars {
    return carCollection.snapshots().map(_carListFromSnapshot);
  }
}
