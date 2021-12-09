import 'package:flutter/material.dart';

class FriendsUI extends StatefulWidget {
  const FriendsUI({ Key? key }) : super(key: key);

  @override
  _FriendsUIState createState() => _FriendsUIState();
}

class _FriendsUIState extends State<FriendsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title:Text("Friends"),
      backgroundColor: Colors.purple[900],
    ),
      body: Center(
        child: Container(
           child: Text("friends"),
        ),
      ),
    );
  }
}