import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  final int i;
  final int j;
  final int flag;

  GridCell({required this.i, required this.j, required this.flag});

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> map = Map();
    map[flag] = [i, j];
   // print(map);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(1),
            color: Colors.red,
            padding: EdgeInsets.all(2),
            child: Center(
              child: Text("$flag"),
            )),
        (i <= 5 && j <= 5)
            ? Container(
                color: Colors.green,
              )
            : Container(),
        (i <= 5 && j >= 9)
            ? Container(
                color: Colors.red,
              )
            : Container(),
        (i >= 9 && j >= 9)
            ? Container(
                color: Colors.yellow,
              )
            : Container(),
        (i >= 9 && j <= 5)
            ? Container(
                color: Colors.blue,
              )
            : Container(),
      ],
    );
  }
}
