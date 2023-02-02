// ignore_for_file: avoid_print

import 'package:cargo/model/CarBooking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/Cars.dart';
import '../model/MyUser.dart';
import '../model/UserTemplate.dart';

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
      String userFullName, String userEmail, String userPassword) async {
    return await usersCollection.doc(uid).set({
      'userFullName': userFullName,
      'userEmail': userEmail,
      'userPassword': userPassword,
    });
  }

  Future carDetailsCollection(
    String hostId,
    String manufacturer,
    String model,
    int makeYear,
    int mileage,
    int gasConsumption,
    int rentPrice,
    String licenseNumber,
    String location,
    String city,
    String wheelDrive,
    String transmission,
    int seats,
    int hoursRented,
    int timesRented,
    String imageUrl,
  ) async {
    return await carCollection.doc().set({
      'carHostId': hostId,
      'carManufacturer': manufacturer,
      'carModel': model,
      'carMakeYear': makeYear,
      'carMileage': mileage,
      'carGasConsumption': gasConsumption,
      'carRentPrice': rentPrice,
      'carLicenseNumber': licenseNumber,
      'carLocation': location,
      'carCity': city,
      'carWheelDrive': wheelDrive,
      'carTransmission': transmission,
      'carSeats': seats,
      'carHoursRented': hoursRented,
      'carTimesRented': timesRented,
      'carImageUrl': imageUrl,
    });
  }

  Future updateTimesHoursRentedCarCollection(
    String carId,
    int hoursRented,
    int timesRented,
  ) async {
    return await carCollection.doc(carId).update({
      'carHoursRented': hoursRented,
      'carTimesRented': timesRented,
    });
  }

  Future updateBookedCarsCollection(
    String carId,
    String customerId,
    DateTime bookingStartDate,
    DateTime bookingEndDate,
    String bookingStatus,
  ) async {
    return await bookedCarsCollection.doc().set({
      'carId': carId,
      'customerId': customerId,
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
          carId: d.id,
          carHostId: d.data().toString().contains('carHostId')
              ? d.get('carHostId')
              : '' "",
          carManufacturer: d.data().toString().contains('carManufacturer')
              ? d.get('carManufacturer')
              : '' "",
          carModel: d.data().toString().contains('carModel')
              ? d.get('carModel')
              : '' "",
          carMakeYear: d.data().toString().contains('carMakeYear')
              ? d.get('carMakeYear')
              : 0,
          carMileage: d.data().toString().contains('carMileage')
              ? d.get('carMileage')
              : 0,
          carGasConsumption: d.data().toString().contains('carGasConsumption')
              ? d.get('carGasConsumption')
              : 0,
          carRentPrice: d.data().toString().contains('carRentPrice')
              ? d.get('carRentPrice')
              : 0,
          carLicenseNumber: d.data().toString().contains('carLicenseNumber')
              ? d.get('carLicenseNumber')
              : '' "",
          carLocation: d.data().toString().contains('carLocation')
              ? d.get('carLocation')
              : '' "",
          carCity: d.data().toString().contains('carCity')
              ? d.get('carCity')
              : '' "",
          carWheelDrive: d.data().toString().contains('carWheelDrive')
              ? d.get('carWheelDrive')
              : '' "",
          carTransmission: d.data().toString().contains('carTransmission')
              ? d.get('carTransmission')
              : '' "",
          carSeats:
              d.data().toString().contains('carSeats') ? d.get('carSeats') : 0,
          carHoursRented: d.data().toString().contains('carHoursRented')
              ? d.get('carHoursRented')
              : 0,
          carTimesRented: d.data().toString().contains('carTimesRented')
              ? d.get('carTimesRented')
              : 0,
          carImageUrl: d.data().toString().contains('carImageUrl')
              ? d.get('carImageUrl')
              : '' "",
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  Stream<List<Cars>> get cars {
    return carCollection.snapshots().map(_carListFromSnapshot);
  }

//Car Booking
  List<CarBooking> _carBookingsListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((d) {
        return CarBooking(
          carBookingId: d.id,
          carId: d.data().toString().contains('carId') ? d.get('carId') : '' "",
          carCustomerId: d.data().toString().contains('customerId')
              ? d.get('customerId')
              : '' "",
          carBookingStartDate: d.data().toString().contains('bookingStartDate')
              ? d.get('bookingStartDate').toDate()
              : DateTime(0),
          carBookingEndDate: d.data().toString().contains('bookingEndDate')
              ? d.get('bookingEndDate').toDate()
              : DateTime(0),
          carBookingStatus: d.data().toString().contains('bookingStatus')
              ? d.get('bookingStatus')
              : '' "",
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  Stream<List<CarBooking>> get carBookings {
    return bookedCarsCollection.snapshots().map(_carBookingsListFromSnapshot);
  }

  Future updateBookingStatus(CarBooking carBooking) async {
    return await bookedCarsCollection.doc(carBooking.carBookingId).update({
      'bookingStatus': "history",
    });
  }

  // Cars getHostCars() {
  //   Cars localCar;
  //   carCollection.doc().snapshots().map((event) {
  //     return Cars(
  //       carId: event.id,
  //       carHostId: event.data().toString().contains('carHostId')
  //           ? event.get('carHostId')
  //           : '' "",
  //       carManufacturer: event.data().toString().contains('carHostId')
  //           ? event.get('carManufacturer')
  //           : '' "",
  //       carModel: event.data().toString().contains('carModel')
  //           ? event.get('carModel')
  //           : '' "",
  //       carMakeYear: event.data().toString().contains('carMakeYear')
  //           ? event.get('carMakeYear')
  //           : 0,
  //       carMileage: event.data().toString().contains('carMileage')
  //           ? event.get('carMileage')
  //           : 0,
  //       carGasConsumption: event.data().toString().contains('carGasConsumption')
  //           ? event.get('carGasConsumption')
  //           : 0,
  //       carRentPrice: event.data().toString().contains('carRentPrice')
  //           ? event.get('carRentPrice')
  //           : 0,
  //       carLicenseNumber: event.data().toString().contains('carLicenseNumber')
  //           ? event.get('carLicenseNumber')
  //           : '' "",
  //       carLocation: event.data().toString().contains('carLocation')
  //           ? event.get('carLocation')
  //           : '' "",
  //       carCity: event.data().toString().contains('carCity')
  //           ? event.get('carCity')
  //           : '' "",
  //       carWheelDrive: event.data().toString().contains('carWheelDrive')
  //           ? event.get('carWheelDrive')
  //           : '' "",
  //       carTransmission: event.data().toString().contains('carTransmission')
  //           ? event.get('carTransmission')
  //           : '' "",
  //       carSeats: event.data().toString().contains('carSeats')
  //           ? event.get('carSeats')
  //           : 0,
  //       carHoursRented: event.data().toString().contains('carHoursRented')
  //           ? event.get('carHoursRented')
  //           : 0,
  //       carTimesRented: event.data().toString().contains('carTimesRented')
  //           ? event.get('carTimesRented')
  //           : 0,
  //       carImageUrl: event.data().toString().contains('carImageUrl')
  //           ? event.get('carImageUrl')
  //           : '' "",
  //     );
  //   });
  // return localCar;
}
  // Stream<List<UserTemplate>> get users {
  //   return usersCollection.snapshots().map(_usersListFromSnapshot);
  // }

  // getCurrentUser(String hostId) {
  //   var userFullName;
  //   userFullName = usersCollection.doc(hostId);
  //   print(userFullName.get());
  // }

  // Future<String> getCurrentUser(String hostId) async {
  //   String userFullName;
  //   var value = await usersCollection.doc(hostId).get();
  //   userFullName = value.get('userFullName');
  //   print(userFullName);
  //   return userFullName;
  // }

  // Future<String> getCurrentUser(String hostId) async {
  //   // ignore: prefer_typing_uninitialized_variables
  //   var userFullName;
  //   var value = await usersCollection
  //       .doc(hostId)
  //       .get()
  //       .then((value) => userFullName = value.get('userFullName'));
  //   print(userFullName);
  //   print("#####");
  //   print(value.toString());
  //   return value.toString();
  // }
  //   var snapshot = usersCollection.snapshots();
  //   try {
  //     return snapshot.docs.map((d) {
  //       if ((d.data().toString().contains('userId')
  //               ? d.get('userId')
  //               : '' "") ==
  //           hostId)
  //             return UserTemplate(
  //             userId: d.data().toString().contains('userId') ? d.get('userId') : '' "",
  //             userFullName: d.data().toString().contains('userFullName'),
  //             );

  //   }) catch (e) {
  //     print(e.toString());
  //     return UserTemplate(userId: 'null', userFullName: 'null');
  //   }
  // }

  // String getUsersss(String hostId, String userFullName) {
  //   UserTemplate userTemplate =
  //       UserTemplate(userId: hostId, userFullName: userFullName);
  //   FirebaseFirestore.instance
  //       .collectionGroup("user")
  //       .where("userId", isEqualTo: hostId);
  //   // .get(userFullName);
  //   return userFullName;
  // }List<Cars> _carListFromSnapshot(QuerySnapshot snapshot) {
  // List<UserTemplate> _usersListFromSnapshot(QuerySnapshot snapshot) {
  //   try {
  //     return snapshot.docs.map((d) {
  //       return UserTemplate(
  //         userFullName: d.data().toString().contains('userFullName')
  //             ? d.get('carHostId')
  //             : '' "",
  //       );
  //     }).toList();
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e.toString());
  //     return [];
  //   }
  // }

  // Stream<List<UserTemplate>> get users {
  //   return usersCollection.snapshots().map(_usersListFromSnapshot);
  // }

