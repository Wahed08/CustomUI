import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _current = 0;
  late CarouselSlider carouselSlider;

  List imageList = [
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
          // title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            // Image.asset("asset/image.jpg"),
            // Icon(Icons.flight, size: 350),
            // Icon(Icons.directions_transit, size: 350),
            // Icon(Icons.directions_car, size: 350),
            CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                  }
                ),
                items: [
                  Image.asset("asset/image.jpg"),
                ]),
                CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  // initialPage: 0,
                  reverse: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                  }
                ),
                items: [
                  Image.asset("asset/image.jpg"),
                ]),
                CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  // initialPage: 0,
                  reverse: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                  }
                ),
                items: [
                  Image.asset("asset/image.jpg"),
                ]),
                CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  // initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                  }
                ),
                items: [
                  Image.asset("asset/image.jpg"),
                ])
          ],
        ),
      ),
    );
  }
}
