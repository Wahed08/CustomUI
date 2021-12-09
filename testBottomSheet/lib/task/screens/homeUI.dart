import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({ Key? key }) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Center(
        child: Container(
          child: Text("Home"),
        ),
      ),
    );
  }
}