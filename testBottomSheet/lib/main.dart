import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task/firstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import './task/googleUser.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
