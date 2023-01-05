import 'package:flutter/material.dart';

class BookedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: Column(children: [
          SizedBox(height: 80),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.deepPurple,
              ),
              width: 200,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(width: 30),
                  Text(
                    "Toyota Rav 4",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Owner No: 14121",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          // color: Colors.yellow,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Material(
                  color: Colors.deepPurple,
                  elevation: 8,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                    bottomLeft: Radius.circular(28),
                  ),
                  child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Ink.image(
                          image: AssetImage("assets/rav4.jpg"),
                          height: 200,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text('End Rent',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                            ))
                      ]))),
            ),
          )
        ]),
      ),
    );
  }
}
