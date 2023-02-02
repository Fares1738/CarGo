import 'dart:io';
import 'package:cargo/cardAddedSuccessfully.dart';
import 'package:cargo/DrivingLicenseUploader.dart';
import 'package:cargo/dashboard.dart';
import 'package:cargo/profileVerifiedSuccessfully.dart';
import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:cargo/verify_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:icrud/firebase_operation/list.dart';
// import 'package:icrud/firebase_operation/firebase_crus.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'CompleteProfile.dart';

class DidUploader extends StatefulWidget {
  DidUploader({Key? key}) : super(key: key);

  @override
  _GovidUploaderState createState() => _GovidUploaderState();
}

class _GovidUploaderState extends State<DidUploader> {
  final _formKey = GlobalKey<FormState>();

  var pname = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final pnameController = TextEditingController();

  String? url;
  // String? urls;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pnameController.dispose();

    super.dispose();
  }

  clearText() {
    pnameController.clear();
  }

  // Adding Student
  CollectionReference pids =
      FirebaseFirestore.instance.collection('licence pictures');

  Future<void> addUser() async {
    final imgurl = await uploadImage(_image!);
    // final imgurls = await uploadImage(_images!);

    return pids
        .add({
          'pname': pname,
          ' frontimage': url,
          // 'backimage': urls,
        })
        .then((value) => print('Govid Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  File? _image;
  // File? _images;
  final picker = ImagePicker();
  // final pickers = ImagePicker();

  // String? downloadUrl;

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        }
      });
    } catch (e) {}
  }

  Future uploadImage(File _image) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();

    Reference refrence =
        FirebaseStorage.instance.ref().child('frontimage').child('user$imgId');
    await refrence.putFile(_image);
    url = await refrence.getDownloadURL();
  }

  // Future imagePickers() async {
  //   try {
  //     final picks = await pickers.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       if (picks != null) {
  //         _images = File(picks.path);
  //       }
  //     });
  //   } catch (e) {}
  // }

  // Future uploadImages(File _images) async {
  //   String imgIds = DateTime.now().microsecondsSinceEpoch.toString();

  //   Reference refrence =
  //       FirebaseStorage.instance.ref().child('backimage').child('user$imgIds');
  //   await refrence.putFile(_images);
  //   urls = await refrence.getDownloadURL();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Add front Side of Driver's License",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.deepPurple)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _image == null
                                      ? Center(child: Text('No image selected'))
                                      : Image.file(_image!,
                                          fit: BoxFit.fitWidth),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      imagePicker();
                                    },
                                    child: Text("Select Image")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                // this container is the value box for taking inputs
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Your name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: pnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            pname = pnameController.text;
                            addUser();
                            clearText();
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddUserPage()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
