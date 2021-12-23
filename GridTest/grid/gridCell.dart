import 'package:flutter/material.dart';

class GridCell extends StatefulWidget {
  final int i;
  final int j;
  final int flag;
  final int output;

  GridCell({required this.i, required this.j, required this.flag, required this.output});

  @override
  _GridCellState createState() => _GridCellState();
}

class _GridCellState extends State<GridCell>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> intAnimation;
  late Tween<double> tween;

  var arr = [
    91.0,
    92.0,
    93.0,
    94.0,
    95.0,
    81.0,
    66.0,
    51.0,
    36.0,
    21.0,
    6.0,
    7.0,
    22.0,
    37.0
  ];

  Color _color = Colors.grey;
  Color _color1 =Colors.limeAccent ;
  double x = 91.0;
  int j = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    tween = Tween<double>(begin: arr[0], end: arr[13]);
    intAnimation = (tween.animate(controller));

    controller.addListener(() {
      setState(() {
        x = arr[j < arr.length ? j++ : arr.length - 1];
      });
    });

    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> map = Map();
    map[widget.flag] = [widget.i, widget.j];
    // print(widget.output);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(1),
            color: Colors.red,
            padding: EdgeInsets.all(2),
            child: Center(
              child: Text("${widget.flag}"),
            )),
        (widget.i <= 5 && widget.j <= 5)
            ? Container(
                color: Colors.green,
              )
            : Container(),
        (widget.i <= 5 && widget.j >= 9)
            ? Container(
                color: Colors.red,
              )
            : Container(),
        (widget.i >= 9 && widget.j >= 9)
            ? Container(
                color: Colors.yellow,
              )
            : Container(),
        (widget.i >= 9 && widget.j <= 5)
            ? Container(
                color: Colors.blue,
              )
            : Container(),
        //
        (widget.i == 2 && widget.j == 2)
            ? GestureDetector(
              child: (widget.output == 6)?Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ):Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: _color1),
            )): Container(),
        //
        (widget.i == 2 && widget.j == 3)
            ? Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: _color1),
              )
            //
            : Container(),
        (widget.i == 3 && widget.j == 2)
            ? Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: _color1),
              )
            : Container(),
        //
        (widget.i == 3 && widget.j == 3)
            ? Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: _color1),
              )
            : Container(),

        (map.keys.first == x.toInt())
            ? GestureDetector(
                onTap: () {
                  //
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _color,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
