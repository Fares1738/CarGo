// import 'dart:core';

class Cars {
  final String manufacturer;
  final String model;
  final int makeyear;
  final int mileage;
  final int gasConsumption;
  final int rentPrice;
  final String licenseNumber;
  final String location;
  final String city;
  final String wheelDrive;
  final String transmission;
  final int seats;
  final int hoursRented;
  final int timesRented;
  final String imageUrl;

  Cars(
      {required this.manufacturer,
      required this.model,
      required this.makeyear,
      required this.mileage,
      required this.gasConsumption,
      required this.rentPrice,
      required this.licenseNumber,
      required this.location,
      required this.city,
      required this.wheelDrive,
      required this.transmission,
      required this.seats,
      required this.hoursRented,
      required this.timesRented,
      required this.imageUrl});
}
