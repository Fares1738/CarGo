import 'package:cloud_firestore/cloud_firestore.dart';

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
      String city) async {
    return await carCollection.doc(uid).set({
      'manufacturer': manufacturer,
      'model': model,
      'makeyear': makeyear,
      'mileage': mileage,
      'gasConsumption': gasConsumption,
      'rentPrice': rentPrice,
      'licenseNumber': licenseNumber,
      'location': location,
      'city': city
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
}
