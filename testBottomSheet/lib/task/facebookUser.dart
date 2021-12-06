import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookUser extends ChangeNotifier {
  String _message = 'Log in/out by pressing the buttons below.';

  Future facebookLogIn() async {
    try {
      final FacebookLoginResult loginResult =
          await FacebookLogin().logIn(['email']);
      switch (loginResult.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = loginResult.accessToken;
          _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
          break;
        case FacebookLoginStatus.cancelledByUser:
          _showMessage('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          _showMessage('Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${loginResult.errorMessage}');
          break;
      }

//
      final userData = FacebookLogin();
      print("object ${userData.isLoggedIn}");

      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      var a = await FirebaseAuth.instance.signInWithCredential(credential);
      print("user ${a.user}");
    } catch (err) {
      print(err);
    }
    notifyListeners();
  }
  
  String get data => _message;
  
  void _showMessage(String message) {
    _message = message;
    notifyListeners();
  }
}
