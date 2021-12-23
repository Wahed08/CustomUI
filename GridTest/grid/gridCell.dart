import 'package:flutter/material.dart';

class GridCell extends StatefulWidget {
  final int i;
  final int j;
  final int flag;
   int output;

  GridCell(
      {required this.i,
      required this.j,
      required this.flag,
      required this.output});

  @override
  _GridCellState createState() => _GridCellState();
}

class _GridCellState extends State<GridCell>
    with TickerProviderStateMixin {
  late AnimationController controller, controller1;
  late Animation<double> intAnimation, intAnimation1;
  late Tween<double> tween, tween1;

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
  Color _color1 = Colors.limeAccent;
  double x = 32.0;
  int j = 0;
  Map<int, int> index = Map();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    // controller1.repeat(reverse: true);
    tween1 = Tween<double>(begin: 20.0, end: 30.0);
    intAnimation1 = (tween1.animate(controller1));
    controller1.addListener(() {
      setState(() {
  
      });
    });
    tween = Tween<double>(begin: arr[0], end: arr[13]);
    intAnimation = (tween.animate(controller));

    controller.addListener(() {
      setState(() {
        x = arr[j < arr.length ? j++ : arr.length - 1];
      });
    });

    _play();
  }

   Future<void> _play() async {
    try {
      await controller1.repeat(reverse: true);
      await controller.forward();
    } catch(err){
        print(err);
    }
  }

  void _alertDialog(int index) {
   
    setState(() {
      x = 91.0;
    });
    print(x);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("About Clicked"),
            content: Text("Index ${index} Clicked"),
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> map = Map();
    map[widget.flag] = [widget.i, widget.j];
    // print(widget.output)
    if (widget.output == 6) {
      index[32] = 1;
      index[33] = 2;
      index[47] = 3;
      index[48] = 4;
    }

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
        (map.keys.first == x.toInt())
            ? GestureDetector(
                onTap: () {
                    controller1.stop();
                   print(index[32]);
                  _alertDialog(index[32]!.toInt());
               
                },
                child: (widget.output == 6)
                    ? Container(
                        height: intAnimation1.value,
                        width: intAnimation1.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _color1,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: _color1),
                      ))
            : Container(),
        //
        (widget.i == 2 && widget.j == 3)
            ? GestureDetector(
                onTap: () {
                  print(index[33]);
                  _alertDialog(index[33]!.toInt());
                },
                child: (widget.output == 6)
                    ? Container(
                        height: intAnimation1.value,
                        width: intAnimation1.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _color1,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: _color1),
                      ))
            //
            : Container(),
        (widget.i == 3 && widget.j == 2)
            ? GestureDetector(
                onTap: () {
                  print(index[47]);
                  _alertDialog(index[47]!.toInt());
                },
                child: (widget.output == 6)
                    ? Container(
                        height: intAnimation1.value,
                        width: intAnimation1.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _color1,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: _color1),
                      ))
            : Container(),
        //
        (widget.i == 3 && widget.j == 3)
            ? GestureDetector(
                onTap: () {
                  print(index[48]);
                  _alertDialog(index[48]!.toInt());
                },
                child: (widget.output == 6)
                    ? Container(
                        height: intAnimation1.value,
                        width: intAnimation1.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _color1,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: _color1),
                      ))
            : Container(),

        // (map.keys.first == x.toInt())
        //     ? GestureDetector(
        //         onTap: () {
        //           //
        //         },
        //         child: Container(
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: _color,
        //           ),
        //         ),
        //       )
        //     : Container(),
      ],
    );
  }
}
