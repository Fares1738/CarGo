// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
//test
class _LoginPageState extends State<LoginPage> {
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
//
            // Text(
            //   "CarGo",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 40,
            //     fontFamily: 'ShadowIntoLight',
            //     color: Color.fromARGB(255, 41, 130, 203),
            //   ),
            // ),

            // SizedBox(height: 10),
            Text(
              "There is no Time to Waste",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //Signin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text("Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
              ),
            ),

            SizedBox(height: 25),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a Member?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(" Register Now",
                    style: TextStyle(
                      color: Colors.blueAccent[400],
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
