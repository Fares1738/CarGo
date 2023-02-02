import 'package:cargo/services/database.dart';
import 'package:cargo/userBookedCarList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookCarDetailsPage.dart';
import 'model/CarBooking.dart';
import 'model/Cars.dart';

class BookedPage extends StatelessWidget {
  // final List _cars = [
  //   CarCardSample(car: car1),
  // ];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CarBooking>?>.value(
        initialData: null,
        value: DatabaseService().carBookings,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
              ),
              Text(
                'Your Current Booked Car',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Expanded(child: UserBookedCarList()),
            ],
          ),
        )));
  }
}

// class CarCardSample extends StatefulWidget {
//   const CarCardSample({super.key, required this.car});
//   final Car car;
//   @override
//   State<CarCardSample> createState() => _CarCardSampleState();
// }

// class _CarCardSampleState extends State<CarCardSample> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) => BookCarDetails(
//         //               carId: widget.car.carId,
//         //             )));
//       },
//       splashColor: Colors.deepPurpleAccent,
//       child: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             child: Container(
//               width: double.infinity,
//               height: 300.0,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(233, 248, 248, 251),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10.0),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.all(10.0),
//                           width: double.infinity,
//                           height: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             // ignore: prefer_const_literals_to_create_immutables
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black45,
//                                   offset: Offset(0, 5),
//                                   blurRadius: 8.0),
//                             ],
//                             image: DecorationImage(
//                               image:
//                                   AssetImage('assets/${widget.car.carPicture}'),
//                               fit: BoxFit.fitWidth,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             // ignore: prefer_const_literals_to_create_immutables
//                             children: <Widget>[
//                               Text(
//                                 '${widget.car.carManfacturer} ${widget.car.carModel} ${widget.car.carMakeYear}',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               SizedBox(width: 60),
//                               Text(
//                                 '${widget.car.carRentPrice.round()} RM/hr',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               )
//                             ],
//                             // ignore: prefer_const_literals_to_create_immutables
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Row(
//                             // ignore: prefer_const_literals_to_create_immutables
//                             children: [
//                               Text(
//                                 widget.car.carLocation,
//                                 style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 4),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(100, 50),
//                     textStyle: TextStyle(fontSize: 21),
//                     backgroundColor: Colors.deepPurple,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)),
//                   ),
//                   child: Text('End Rent'),
//                   onPressed: () async {},
//                 ),
//                 SizedBox(height: 5.0),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
