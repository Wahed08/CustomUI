import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    // Color _color = Color(0xff5E35B1);
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.purple[900],
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
            SizedBox(
              height: 320,
            ),
              ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.facebookF),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo[600],
                onPrimary: Colors.white,
                minimumSize: Size(230, 45)
              ),
              onPressed: () {}, 
              label: Text("Login with Facebook")),
              SizedBox(height: 7,),
              ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
                onPrimary: Colors.white,
                minimumSize: Size(230, 45)
              ),
              onPressed: () {}, 
              label: Text("Login with Google")),
               SizedBox(height: 7,),
               ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.userGraduate),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber[900],
                onPrimary: Colors.white,
                minimumSize: Size(230, 45)
              ),
              onPressed: () {}, 
              label: Text("Play as Guest")),
          ],
        ),
      ]),
    );
  }
}
