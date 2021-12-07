import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookUser extends ChangeNotifier {
  Map? _userData;

  Future facebookLogIn() async {
    try {

      var facebookLogin = FacebookLogin();
      final FacebookLoginResult loginResult = await FacebookLogin().logIn(['public_profile', 'email']);

      switch (loginResult.status){
        case FacebookLoginStatus.loggedIn:
        print("logged in");
         var graphResponse = await http.get(Uri.parse("https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${loginResult.accessToken.token}"));
          _userData = json.decode(graphResponse.body);
          // _userData= profile.toString() as Map;
          // print("fffff ${profile.toString()}");
        break;

        case FacebookLoginStatus.cancelledByUser:
        print("cancel by user");
        break;

        case FacebookLoginStatus.error:
        print("Error");
        break;
      }

      final credential = FacebookAuthProvider.credential(loginResult.accessToken.token);
      var a = await FirebaseAuth.instance.signInWithCredential(credential);

      print(a.user!.email);

    } catch (err) {
      print(err);
    }
    notifyListeners();
  }

  Map get data => _userData!;
}
