// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:cargo/location_model.dart';
import 'package:flutter/material.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  _Cities createState() => _Cities();
}

class _Cities extends State<Cities> {
  static List<String> cityName = [
    'Kuala Lumpur',
    'Alor Setar',
    'Kuching',
    'Ipoh',
    'Melacca',
    'Johor Bahru'
  ];

  static List url = [
    'https://cdn.britannica.com/49/102749-050-B4874C95/Kuala-Lumpur-Malaysia.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/cc/Menara_as.jpg',
    'https://lp-cms-production.imgix.net/2019-06/71f5f8232e28908fee31a8abd7766f33-top-things-to-do-in-kuching.jpg',
    'https://img.theculturetrip.com/wp-content/uploads/2021/03/2a7966x-e1617787498867.jpg',
    'https://www.trailsofindochina.com/wp-content/uploads/2019/07/Malacca-header.jpg',
    'https://cdn.enjoytravel.com/img/travel-news/johor-bahru-is-the-southernmost-city-in-malaysia.jpg'
  ];

  final List<Location> location = List.generate(
      cityName.length, (index) => Location(cityName[index], '${url[index]}'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CarGoAppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SearchElevatedButton(),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: cityName.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(location[index].name),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                location[index].image,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }

  ElevatedButton SearchElevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cities()),
        );
      },
      icon: Text("Search for a Location"),
      label: Icon(
        Icons.search,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(340, 50),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.black)),
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
}
