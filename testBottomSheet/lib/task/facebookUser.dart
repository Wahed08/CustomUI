import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookUser extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  
  FacebookAuth? _user;
  FacebookAuth get user => _user!;

  Future facebookLogIn() async {
    final fbUser = await FacebookAuth.instance.login();
    if (fbUser == null) return;

    final userData = FacebookAuth.instance.getUserData();
    final googleAuth = await fbUser.status;

    final credential = FacebookAuthProvider.credential(
     fbUser.accessToken!.token
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
}