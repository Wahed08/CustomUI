import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './googleUser.dart';
import './signInOptions.dart';

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

    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.purple[900],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            _isLoading?SizedBox(
              height: 400,
            ): SizedBox(height: 320,),
            _isLoading ? Text("Loading", style: TextStyle(color: Colors.white, fontSize: 15),) : SignInOptions()
          ],
        ),
      ]),
    );
  }
}
