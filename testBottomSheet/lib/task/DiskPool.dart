import 'package:flutter/material.dart';

class DiskPoolScreen extends StatefulWidget {
  const DiskPoolScreen({Key? key}) : super(key: key);

  @override
  _DiskPoolScreenState createState() => _DiskPoolScreenState();
}

class _DiskPoolScreenState extends State<DiskPoolScreen> with SingleTickerProviderStateMixin{

  List images = [
      "image.jpg",
      "image.jpg",
      "image.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child:Text("Disk Pool", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelColor: Colors.black,
                    // isScrollable: true,
                    labelPadding:EdgeInsets.only(left: 20, right: 20),
                    unselectedLabelColor: Colors.grey,
                    indicator: CircleIndicator(color: Colors.black54, radius: 4),
                    controller: _tabcontroller,
                              tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspirations",),
                  Tab(text: "Emotions",)
                              ],
                            ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.maxFinite,
              height: 350,
              child: TabBarView(
                controller: _tabcontroller,
                children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, index){
                  return Container(
                    height: 300,
                    width: 200,
                    margin: EdgeInsets.only(right: 10, top: 10),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "asset/"+images[index]
                        )
                      )
                    ),
                  );
                }),
                    ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index){
                  return Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "asset/"+images[index]
                        )
                      )
                    ),
                  );
                }),
                    ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index){
                  return Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "asset/"+images[index]
                        )
                      )
                    ),
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
class CircleIndicator extends Decoration{
  final Color color;
  double radius;

  CircleIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{
  final double radius;
  late Color color;

  _CirclePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg){
    late Paint _paint;

    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;

    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
