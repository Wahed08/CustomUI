import 'package:flutter/material.dart';
import './grid/Board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Board(),
        ),
      ),
    );
  }
}