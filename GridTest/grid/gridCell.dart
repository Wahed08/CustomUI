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
  late Animation<int> intAnimation;

  var arr = [91, 92, 93, 94, 95, 81];

  Color _color = Colors.grey;
  int x = 91;

  @override
  void initState() {
    int y = 1;
    int z = 0;
     super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    Tween<int> tween = Tween<int>(begin: arr[z], end: arr[y]);
    intAnimation = (tween.animate(controller)
      ..addListener(() {
        for (int i = 0; i < arr.length-1; i++) {
          setState(() {
            z++;
            y++;
            x = intAnimation.value;
          });
        }
      }));
    controller.forward();
   
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
    int i = 0;
    // print(map);

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
        (map.keys.first == x)
            ? GestureDetector(
                onTap: () {
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
            : Container()
      ],
    );
  }
}
