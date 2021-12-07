import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        toolbarHeight: 80,
        title: Text("${user.displayName!}"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          )
        ],
      ),
      body: Stack(children: [
        Container(
          color: Colors.purple[900],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  "CARROM",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                       style: ElevatedButton.styleFrom(side: BorderSide(width: 5.0, color: Colors.red,),primary: Colors.deepPurple[800]),
                        onPressed: () {},
                        child: Container(
                          height: 120,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                              Text("Disc Pool",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(side: BorderSide(width: 5.0, color: Colors.blue,),primary: Colors.deepPurple[800]),
                        onPressed: () {},
                        child: Container(
                          height: 120,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                              Text("Carrom",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(side: BorderSide(width: 5.0, color: Colors.green,),primary: Colors.deepPurple[800]),
                        onPressed: () {},
                        child: Container(
                          height: 120,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                              Text("Freestyle",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(side: BorderSide(width: 5.0, color: Colors.yellow,),primary: Colors.deepPurple[800]),
                        onPressed: () {},
                        child: Container(
                          height: 120,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                              Text("Offline",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        // currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "asset/house_icon.png",
              height: 45,
              width: 45,
            ),
            label: "Home",
            backgroundColor: Colors.deepPurple[700],
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/users_people_group_friends_icon.png",
                height: 45,
                width: 45,
              ),
              label: "Friends"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/general_office_repair_repair tool_icon.png",
                height: 45,
                width: 45,
              ),
              label: "Equipment"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/buy_cart_market_purchase_shop_icon.png",
                height: 45,
                width: 45,
              ),
              label: "Shop")
        ],
      ),
    );
  }
}
