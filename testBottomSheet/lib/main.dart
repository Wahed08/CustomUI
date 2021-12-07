import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/task/GoogleProfileUI.dart';
import 'package:test/task/facebookProfileUI.dart';
import './task/firstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import './task/googleUser.dart';
import './task/facebookUser.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleUser()),
        ChangeNotifierProvider(create: (context) => FacebookUser()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/profile': (context) => ProfileUI(),
          '/fbprofile': (context) => FacebookProfileUI()
        },
        debugShowCheckedModeBanner: false,
        // home: FirstScreen(),
      ),
    );
  }
}
