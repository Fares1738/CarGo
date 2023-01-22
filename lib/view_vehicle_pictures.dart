// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unnecessary_nullable_for_final_variable_declarations, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:cargo/add_car_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VehiclePictures extends StatefulWidget {
  const VehiclePictures({super.key});

  @override
  VehiclePicturesState createState() => VehiclePicturesState();
}

class VehiclePicturesState extends State<VehiclePictures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CarGoAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 45),
                  textStyle: TextStyle(fontSize: 17),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Select Pictures'),
                onPressed: () {
                  selectImages();
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: imageFileList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        );
                      }),
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
                    MaterialPageRoute(builder: (context) => AddVehicle()),
                  );
                },
              ),
              SizedBox(height: 200),
            ],
          ),
        ));
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
