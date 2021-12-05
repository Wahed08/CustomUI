import 'package:flutter/material.dart';

class LoadingCarromScreen extends StatefulWidget {
  const LoadingCarromScreen({Key? key}) : super(key: key);

  @override
  _LoadingCarromScreenState createState() => _LoadingCarromScreenState();
}

class _LoadingCarromScreenState extends State<LoadingCarromScreen> {

  var _isLoading = false;

  @override
  void initState() {
    _isLoading = true;

    Future.delayed(Duration(seconds: 2)).then((_) {
        setState(() {
          _isLoading = false;
        });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _color = Color(0xff800080);
    return Scaffold(
      body: Stack(children: [
        Container(
          color: _color,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 120),
                child: Text(
                "CARROM",
                style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 330,),
            // Center(
            //   child: _isLoading ? Text("Loading"): Text("data"),
            // )
            ListTile(title: Text("Facebook"),)
          ],
        ),
      ]),
    );
  }
}
