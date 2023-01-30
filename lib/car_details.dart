// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, unnecessary_nullable_for_final_variable_declarations, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:io';

import 'package:cargo/host_page.dart';
import 'package:cargo/view_vehicle_pictures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    required this.city,
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
  final Text city;

  @override
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

                    Text("City",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.city,
                    SizedBox(height: 8),

                    Text("Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.location,

                    // Select and print gridview of selected images

                    /////////////////////////////////////////
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: GridView.builder(
                    //         padding: const EdgeInsets.all(20),
                    //         itemCount: imageFileList!.length,
                    //         gridDelegate:
                    //             SliverGridDelegateWithFixedCrossAxisCount(
                    //                 crossAxisCount: 1),
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return Image.file(
                    //             File(imageFileList![index].path),
                    //             fit: BoxFit.cover,
                    //           );
                    //         }),
                    //   ),
                    // ),
                    /////////////////////////////////////////

                    SizedBox(height: 15),

                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 45),
                              textStyle: TextStyle(fontSize: 17),
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
                                      builder: (context) => VehiclePictures()));
                            },
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        textStyle: TextStyle(fontSize: 17),
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
      iconTheme: IconThemeData(color: Colors.black),
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

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }
}
