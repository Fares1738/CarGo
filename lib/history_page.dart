import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      //Fix RenferFlex issue
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "All your rent's history",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Material(
                    color: Colors.deepPurple,
                    elevation: 8,
                    child: InkWell(
                        splashColor: Colors.black26,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: NetworkImage(
                                "https://www.motortrend.com/uploads/2022/05/2023-Toyota-RAV4-TRD-Off-Road.jpg?fit=around%7C875:492.1875"),
                            height: 200,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('Toyota Rav 4',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                          Text('Owner: 131441',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 216, 216, 216),
                              )),
                        ]))),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Material(
                    color: Colors.deepPurple,
                    elevation: 8,
                    child: InkWell(
                        splashColor: Colors.black26,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: NetworkImage(
                                "https://images.wapcar.my/file1/7b7992d699df4420a88f0f13dc40879e_1072x604.jpg"),
                            height: 200,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('Ford Mustang',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                          Text('Owner: 121414',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 216, 216, 216),
                              )),
                        ]))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
