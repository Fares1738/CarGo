// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 10),
            // Hello again!

            Image.asset(
              'assets/CarGo.png',
              height: 200,
              width: 400,
            ),

            SizedBox(height: 10),
            Text(
              "No Time To Waste!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            // Email address

            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //     child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.red,
            //           border: Border.all(color: Colors.blue),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //             padding: const EdgeInsets.only(left: 20.0),
            //             child: TextField(
            //                 decoration: InputDecoration(
            //               border: InputBorder.none,
            //             ))))),

            // SizedBox(height: 10),

            SizedBox(height: 10),

            //Signin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text("Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                ),
              ),
            ),

            SizedBox(height: 25),
          ]),
        ),
      ),
    );
  }
}
