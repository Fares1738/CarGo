// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cargo/history_page.dart';
import 'package:cargo/landing_page.dart';
import 'package:flutter/material.dart';

import 'booked_page.dart';

class RentPage extends StatefulWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Center(
              child: Column(children: [
                Image.asset(
                  'assets/CarGo2.png',
                  width: 70,
                  height: 100,
                ),
                TabBar(
                  tabs: [
                    Text("Rent",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Booked",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("History",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),

                Expanded(
                  child: TabBarView(children: [
                    Container(
                        color: Colors.red,
                        child: Center(
                          child:
                              Text('1st TAB', style: TextStyle(fontSize: 40)),
                        )),
                    BookedPage(),
                    HistoryPage(),
                  ]),
                )
                // Card(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(12)),
                //   elevation: 5,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(0.1),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: TabBar(
                //       indicator: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         color: Colors.deepPurple,
                //       ),
                //       controller: tabController,
                //       isScrollable: true,
                //       labelPadding: EdgeInsets.symmetric(horizontal: 30),
                //       tabs: [
                //         Tab(
                //           child:
                //               Text("Rent", style: TextStyle(color: Colors.black)),
                //         ),
                //         Tab(
                //           child:
                //               Text("Booked", style: TextStyle(color: Colors.black)),
                //         ),
                //         Tab(
                //           child: Text("History",
                //               style: TextStyle(color: Colors.black)),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Expanded(
                //     child: TabBarView(controller: tabController, children: [
                //   ListView.builder(
                //       physics: BouncingScrollPhysics(),
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         return Card(
                //             margin:
                //                 EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                //             child: ListTile(
                //               title: Text("TESTING"),
                //               subtitle: Text("MMMMM"),
                //               trailing: Icon(
                //                 Icons.phone_callback,
                //                 color: Colors.green,
                //               ),
                //             ));
                //       }),
                // ])),
              ]),
            ),
          ),
        ));
  }
}
