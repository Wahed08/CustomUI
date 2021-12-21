import 'package:flutter/material.dart';

class GridCell extends StatefulWidget {
  final int i;
  final int j;
  final int flag;

  GridCell({required this.i, required this.j, required this.flag});

  @override
  _GridCellState createState() => _GridCellState();
}

class _GridCellState extends State<GridCell>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> intAnimation;

  var arr = [91.0, 92.0, 93.0, 94.0, 95.0, 81.0];

  Color _color = Colors.grey;
  double x = 91.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    Tween<double> tween = Tween<double>(begin: arr[0], end: arr[4]);
    intAnimation = (tween.animate(controller));

    controller.addListener(() {
      setState(() {
        x = intAnimation.value;
      });
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // void pressed(){
  //   controller.forward();
  // }

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> map = Map();
    map[widget.flag] = [widget.i, widget.j];
    int i = 0;

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
        (map.keys.first == x.toInt())
            ? GestureDetector(
                onTap: () {
                  // pressed();
                  print(arr[i]);
                  i++;
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
