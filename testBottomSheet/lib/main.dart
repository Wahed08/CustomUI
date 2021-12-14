import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/task/profile/GoogleProfileUI.dart';
import 'package:test/task/profile/facebookProfileUI.dart';
import 'task/screens/firstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'task/user/googleUser.dart';
import './task/user/facebookUser.dart';
import 'task/screens/homeUI.dart';
import './task/screens/friendsUI.dart';
import './task/screens/shopUI.dart';
import './task/screens/equipementUI.dart';
import './task/screens/sslCommerz.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SSLCoomerz());
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
          '/fbprofile': (context) => FacebookProfileUI(),
          '/home': (context) => HomeUI(),
          '/friends': (context) => FriendsUI(),
          '/equipement': (context) => EquipementUI(),
          '/shop': (context) => ShopUI(),
        },
        debugShowCheckedModeBanner: false,
        // home: FirstScreen(),
      ),
    );
  }
}
