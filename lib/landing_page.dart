// ignore_for_file: unused_import

// ignore_for_file: prefer_const_constructors

import 'package:cargo/add_car_details.dart';
import 'package:cargo/login_page.dart';
import 'package:cargo/register_page.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LandingPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/CarGo2.png',
              width: 270,
              height: 200,
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        textStyle: TextStyle(fontSize: 25),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      textStyle: TextStyle(fontSize: 25),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(200, 50),
                  //     textStyle: TextStyle(fontSize: 25),
                  //     backgroundColor: Colors.deepPurple,
                  //     foregroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0)),
                  //   ),
                  //   //Add Vehicle button
                  //   child: Text('Add a Vehicle'),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => AddVehicle(
                  //                 Manufacturer: '',
                  //                 Model: '',
                  //                 license_plate: '',
                  //                 wheel_drive: '',
                  //                 transmission: '',
                  //                 location: '',
                  //                 Make_year: 2014,
                  //                 Mileage: 10000,
                  //                 rent_price: 5000,
                  //                 seats_number: 4,
                  //                 gas_consumption: 24,
                  //               )),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
