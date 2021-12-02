import 'package:flutter/material.dart';
import './secondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 30),
              child: ClipOval(
                  child: Image.asset(
                "asset/image.jpg",
                fit: BoxFit.cover,
                height: 130,
                width: 130,
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                "Chess Fuss",
                style: TextStyle(fontSize: 30, color: Colors.red[600]),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button1(
                        text: "D Pool",
                        onClicked: () => showModalBottomSheet(
                          isScrollControlled: true,
                            context: context,
                            builder: (context) => buildSheet()),
                      ),
                      SizedBox(width: 35),
                      Button2(context),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button3(context),
                      SizedBox(width: 50),
                      Button4(context),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
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
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Button1({required String text, required VoidCallback onClicked}) =>
      ElevatedButton(
          onPressed: onClicked,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
            child: Text("D Pool",
                style: TextStyle(
                  fontSize: 25,
                )),
          ));

  Widget buildSheet() => SecondScreen();

  ElevatedButton Button2(BuildContext context) => ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
        child: Text("Carrom",
            style: TextStyle(
              fontSize: 25,
            )),
      ));

  ElevatedButton Button3(BuildContext context) => ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
        child: Text("Chess",
            style: TextStyle(
              fontSize: 25,
            )),
      ));

  ElevatedButton Button4(BuildContext context) => ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
        child: Text("Check",
            style: TextStyle(
              fontSize: 25,
            )),
      ));
}
