// ignore_for_file: camel_case_types, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:cargo/cars_in_city.dart';
import 'package:cargo/model/location_model.dart';
import 'package:flutter/material.dart';

class Cities extends StatefulWidget {
  Cities({Key? key}) : super(key: key);

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
                  child: Search(),
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
                              child: Image.network(location[index].image,
                                  fit: BoxFit.cover, height: 50, width: 50),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
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

  List<Location> display_list = List.from(cityName);

   void updateList (String value){
    setState(() {

    });
   }
}

class Search extends StatelessWidget {
  Search({super.key});

  final userCity = TextEditingController();

  void dispose() {
    userCity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: userCity,
            //onChanged: searchCity,
            decoration: InputDecoration(
                suffixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: IconButton(
                    icon: Icon(Icons.search_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Cars(city: Text(userCity.text))));
                    },
                  ),
                ),
                border: InputBorder.none,
                hintText: "Try Johor Bahru",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ),
    );
  }



}
