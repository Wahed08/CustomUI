import 'package:flutter/material.dart';

class EquipementUI extends StatefulWidget {
  const EquipementUI({ Key? key }) : super(key: key);

  @override
  _EquipementUIState createState() => _EquipementUIState();
}

class _EquipementUIState extends State<EquipementUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text("Equipement"),
      ),
      body: Center(
        child: Container(
           child: Text("equipement"),
        ),
      ),
    );
  }
}