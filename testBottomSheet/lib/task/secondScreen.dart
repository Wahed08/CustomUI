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
    "asset/image.jpg",
    "asset/image.jpg",
    "asset/image.jpg",
    "asset/image.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: IndexedStack(
      index: _current,
      // color: Colors.black,
      children: [Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(onPressed: (){onTap;}, child: Text("1")),
                ElevatedButton(onPressed: (){onTap;}, child: Text("2")),
                ElevatedButton(onPressed: (){}, child: Text("3")),
                ElevatedButton(onPressed: (){}, child: Text("4"))
            ],),
          ),
           CarouselSlider(
            options: CarouselOptions(
                height: 400,
                initialPage: 0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                // onPageChanged: (index, reason) {
                //   setState(() {
                //     _current = index;
                //   });
                // }
                ),
            items: imageList.map((image) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: _width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(color: Colors.red),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ); 
              });
            }).toList(),
          )
        ],
      ),]
      
    )
    );
  }
   void onTap(int index){
    setState(() {
      _current = index;
    });
  }
}
