import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  //Collection Reference

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference carCollection =
      FirebaseFirestore.instance.collection('cars');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

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
      'imageUrl' : imageUrl
    });
  }
}
