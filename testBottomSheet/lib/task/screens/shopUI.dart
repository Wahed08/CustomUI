import 'package:flutter/material.dart';

class ShopUI extends StatefulWidget {
  const ShopUI({ Key? key }) : super(key: key);

  @override
  _ShopUIState createState() => _ShopUIState();
}

class _ShopUIState extends State<ShopUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Center(
        child: Container(
          child: Text("Shop"),
        ),
      ),
    );
  }
}