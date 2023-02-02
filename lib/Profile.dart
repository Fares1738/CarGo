import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }

  ////////////////////////////////CODE FOR RETRIEVING DATA FROM DATABASE///////////////////////////////////

  // final CollectionReference userDetailsCollection =
  //     FirebaseFirestore.instance.collection('userdetails');

  // Future<void> getUserDetails() async {
  //   final DocumentSnapshot snapshot =
  //       await userDetailsCollection.doc().get();

  //     final String pname = snapshot.data['pname'] as;
  //     final String govid = snapshot.data['govid'];
  //     final String driveid = snapshot.data['driveid'];
  //     final String image = snapshot.data['image'];

  //     print('pname: $pname');
  //     print('govid: $govid');
  //     print('driveid: $driveid');
  //     print('image: $image');

  // }
  ////////////////////////////////CODE FOR RETRIEVING DATA FROM DATABASE///////////////////////////////////
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 25),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Image.asset("assets/profile.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name: ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email: ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Passport/MyKad: ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Drivers License Number: ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
