// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unnecessary_nullable_for_final_variable_declarations, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:cargo/reusable_widget/InputDeco.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'car_details.dart';
import 'reusable_widget/Custom_AppBar.dart';

class AddVehicle extends StatefulWidget {
  final FirebaseStorage storage = FirebaseStorage.instance;

  AddVehicle({super.key});

  @override
  State<StatefulWidget> createState() => AddVehicleState();
}

//
class AddVehicleState extends State<AddVehicle> {
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final makeyear = TextEditingController();
  final mileage = TextEditingController();
  final gasConsumption = TextEditingController();
  final rentPrice = TextEditingController();
  final licenseNumber = TextEditingController();
  final location = TextEditingController();
  final city = TextEditingController();
  int hoursRented = 0;
  int timesRented = 0;
  String imageUrl = '';

  List<String> wheelDriveMenu = [
    'Rear-Wheel Drive',
    'Front-Wheel Drive',
    'Four-Wheel Drive',
    'All-Wheel Drive'
  ];
  String? selectedWheelDrive = 'Front-Wheel Drive';

  List<String> seatNum = ['2', '4', '6', '8'];
  String? selectedSeatNum = '4';

  List<String> TransmissionType = ['Automatic', 'Manual'];
  String? selectedTransType = 'Automatic';

  List<String> cityName = [
    'Kuala Lumpur',
    'Alor Setar',
    'Kuching',
    'Ipoh',
    'Melacca',
    'Johor Bahru'
  ];
  String? selectedCity = 'Johor Bahru';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    manufacturer.dispose();
    model.dispose();
    makeyear.dispose();
    mileage.dispose();
    gasConsumption.dispose();
    rentPrice.dispose();
    licenseNumber.dispose();
    location.dispose();
    city.dispose();
    super.dispose();
  }

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
              SizedBox(height: 10),

              Text(
                'Add your car details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              //Manufacturer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: manufacturer,
                      decoration: buildInputDecoration(
                          Icons.precision_manufacturing, "Manufacturer")),
                ),
              ),

              SizedBox(height: 10),

              //Model
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: model,
                      decoration:
                          buildInputDecoration(Icons.car_crash, "Model")),
                ),
              ),

              SizedBox(height: 10),

              //Make Year
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: makeyear,
                      decoration:
                          buildInputDecoration(Icons.date_range, "Make Year")),
                ),
              ),

              SizedBox(height: 10),

              //Mileage
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: mileage,
                      decoration: buildInputDecoration(Icons.speed, "Mileage")),
                ),
              ),

              SizedBox(height: 10),

              //Gas Consumption
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: gasConsumption,
                      decoration: buildInputDecoration(Icons.gas_meter_outlined,
                          "Gas Consumption (in KM/L)")),
                ),
              ),
              SizedBox(height: 10),

              //Rent Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: rentPrice,
                      decoration: buildInputDecoration(
                          Icons.attach_money_rounded,
                          "Rent Price per Hour (RM)")),
                ),
              ),
              SizedBox(height: 10),

              //License Plate Number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: licenseNumber,
                      decoration: buildInputDecoration(
                          Icons.numbers_rounded, "License Plate Number")),
                ),
              ),
              SizedBox(height: 10),

              //Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                      controller: location,
                      decoration:
                          buildInputDecoration(Icons.location_on, "Location")),
                ),
              ),
              SizedBox(height: 10),

              //City
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("City: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 82.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: DropdownButton<String>(
                                value: selectedCity,
                                items: cityName
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => selectedCity = item)),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 10),

              //Wheel Drive

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Wheel Drive: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: DropdownButton<String>(
                                value: selectedWheelDrive,
                                items: wheelDriveMenu
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => selectedWheelDrive = item)),
                          ),
                        ),
                      )),
                ],
              ),

              SizedBox(height: 10),

              //Transmission
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Transmission: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: DropdownButton<String>(
                                value: selectedTransType,
                                items: TransmissionType.map((item) =>
                                    DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold)))).toList(),
                                onChanged: (item) =>
                                    setState(() => selectedTransType = item)),
                          ),
                        ),
                      )),
                ],
              ),

              SizedBox(height: 10),

              //Number of Seats
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Number of Seats: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: DropdownButton<String>(
                                value: selectedSeatNum,
                                items: seatNum
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => selectedSeatNum = item)),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 10),

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

                      //Pick image from phone storage and save it in firebase storage, and also generate download link//
                      onPressed: (() async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print('${file?.path}');

                        String uniqueFileName =
                            DateTime.now().millisecondsSinceEpoch.toString();

                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('images');

                        Reference referenceImageToUpload =
                            referenceDirImages.child(uniqueFileName);

                        try {
                          await referenceImageToUpload
                              .putFile(File(file!.path));
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                          print(imageUrl);
                        } catch (e) {}

                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please upload an image")));
                          return;
                        }
                      }),
                      //selectFile,
                      child: Text('Add Car Pictures'),
                      //selectImages();
                    ),
                  ],
                ),
              ),

              // Print image
              //   if (pickedFile != null)
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    // child: Image.file(
                    //   File(pickedFile!.path!),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),

              // Print gridview of images
              // Container(
              //   margin: const EdgeInsets.all(15),
              //   padding: const EdgeInsets.all(3.0),
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.black)),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: GridView.builder(
              //         shrinkWrap: true,
              //         padding: const EdgeInsets.all(5),
              //         itemCount: imageFileList!.length,
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 3),
              //         itemBuilder: (BuildContext context, int index) {
              //           return Image.file(
              //             File(imageFileList![index].path),
              //             fit: BoxFit.cover,
              //           );
              //         }),
              //   ),
              // ),

              //Next Page Button
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        textStyle: TextStyle(fontSize: 20),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Next'),
                      onPressed: () {
                        //uploadFile;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewAddedVehicle(
                                    manufacturer: Text(manufacturer.text),
                                    model: Text(model.text),
                                    makeyear: Text(makeyear.text),
                                    mileage: Text(mileage.text),
                                    gasConsumption: Text(gasConsumption.text),
                                    rentPrice: Text(rentPrice.text),
                                    licenseNumber: Text(licenseNumber.text),
                                    wheelDrive: Text(selectedWheelDrive!),
                                    seats: Text(selectedSeatNum!),
                                    transmission: Text(selectedTransType!),
                                    location: Text(location.text),
                                    city: Text(selectedCity!),
                                    /// images: imageFileList!,
                                    hoursRented: 0,
                                    timesRented: 0,
                                    imageUrl: imageUrl)));
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        )),
      ),
    );
  }

  // PlatformFile? pickedFile;

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

  // Future uploadFile() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file);
  // }

  // Multi-image picker

  // final ImagePicker imagePicker = ImagePicker();
  // List<XFile>? imageFileList = [];

  // void selectImages() async {
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     imageFileList!.addAll(selectedImages);
  //   }
  //   print("Image List Length:" + imageFileList!.length.toString());
  //   setState(() {});
  // }
}
