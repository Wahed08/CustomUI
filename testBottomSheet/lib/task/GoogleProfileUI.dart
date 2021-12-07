import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Padding(
      //        padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
      //         child: CircleAvatar(
      //           radius: 40,
      //           backgroundImage: NetworkImage(user.photoURL!),
      //         ),
      //       ),
      //       Text("Name: " + user.displayName!, style: TextStyle(fontSize: 16),),
      //       SizedBox(height: 7,),
      //       Text(user.email!)
      //     ],
      //   ),
      // ),
      body: Stack(children: [
        Container(
          color: Colors.purple[900],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 120),
                child: Text(
                  "CARROM",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 90,),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          child: Column(
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                              Text("Disc Pool",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          child: Column(
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                              Text("Carrom",
                                  style: TextStyle(
                                    fontSize: 25,
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
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          child: Column(
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                              Text("Freestyle",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          child: Column(
                            children: [
                              Text("Play",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                              Text("Offline",
                                  style: TextStyle(
                                    fontSize: 25,
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
        // currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text("Menu"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Person"),
              backgroundColor: Colors.blue)
        ],
        // onTap: (index) {
        //   setState(() {
        //     _index = index;
        //   });
        // },
      ),
    );
  }
}
