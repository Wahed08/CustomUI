import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiskPoolScreen extends StatefulWidget {
  const DiskPoolScreen({Key? key}) : super(key: key);

  @override
  _DiskPoolScreenState createState() => _DiskPoolScreenState();
}

class _DiskPoolScreenState extends State<DiskPoolScreen>
    with SingleTickerProviderStateMixin {
  List images = ["image.jpg", "image.jpg", "image.jpg"];

   var colors = [
    Colors.cyan,
    Colors.deepOrange[200],
    Colors.lightGreen,
  ];
    var firstName = [
    "Dhaka",
    "Singapore",
    "Malayasia"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        color: Colors.purple[900],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Disk Pool",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelColor: Colors.white,
                    // isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    unselectedLabelColor: Colors.grey,
                    indicator: CircleIndicator(color: Colors.white, radius: 4),
                    controller: _tabcontroller,
                    tabs: [
                      Tab(
                          child: Text(
                        "Places",
                        style: GoogleFonts.oswald(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      )),
                      Tab(
                        child: Text("Inspire",
                            style: GoogleFonts.oswald(
                                fontSize: 17, fontWeight: FontWeight.w400)),
                      ),
                      Tab(
                        child: Text("Emotions",
                            style: GoogleFonts.oswald(
                                fontSize: 17, fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: double.maxFinite,
              height: 350,
              child: TabBarView(controller: _tabcontroller, children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: colors[index]),
                          onPressed: () {},
                          child: Container(
                            height: 300,
                            width: 200,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text("${firstName[index]}",
                                        style: GoogleFonts.odibeeSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30)),
                                    Text("Arena",
                                        style: GoogleFonts.odibeeSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25))
                                  ],
                                )),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  color: Colors.black,
                                                  offset: Offset(1, 3))
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        height: 50,
                                        width: 200,
                                        // color: Colors.blueGrey,
                                        child: Center(
                                            child: Text(
                                          "Prize",
                                          style: GoogleFonts.lato(fontSize: 20),
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  color: Colors.black,
                                                  offset: Offset(1, 3))
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        height: 50,
                                        width: 200,
                                        child: Center(
                                            child: Text(
                                          "Player Online",
                                          style: GoogleFonts.lato(fontSize: 20),
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  color: Colors.black,
                                                  offset: Offset(1, 3))
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        height: 50,
                                        width: 200,
                                        child: Center(
                                            child: Text(
                                          "Entry Fee",
                                          style: GoogleFonts.lato(fontSize: 20),
                                        )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("asset/" + images[index]))),
                      );
                    }),
                ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("asset/" + images[index]))),
                      );
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleIndicator extends Decoration {
  final Color color;
  double radius;

  CircleIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;

  _CirclePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;

    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;

    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
