import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
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
    // print("hello");
    _isLoading = true;

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var result = await Connectivity().checkConnectivity();
    print(result);
    final hasInternet = result != ConnectivityResult.none;
    if (hasInternet) {
      setState(() {
        _isLoading = false;
      });
    } else {
      _showDialog();
      // setState(() {
      //   _isLoading = true;
      // });
    }
    super.didChangeDependencies();
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Internet"),
            content: Text("you don't have internet connecion"),
            actions: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Ok"))
            ],
          );
        });
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
            _isLoading
                ? SizedBox(
                    height: 400,
                  )
                : SizedBox(
                    height: 320,
                  ),
            _isLoading
                ? Text("Loading..", style: TextStyle(color: Colors.white),)
                : SignInOptions()
          ],
        ),
      ]),
    );
  }
}
