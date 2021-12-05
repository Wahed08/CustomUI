import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './googleUser.dart';

class SignInOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final googleData = Provider.of<GoogleUser>(context, listen: false);

    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.facebookF),
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[600],
                  onPrimary: Colors.white,
                  minimumSize: Size(230, 45)),
              onPressed: () {},
              label: Text("Login with Facebook")),
          SizedBox(
            height: 7,
          ),
          ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[400],
                  onPrimary: Colors.white,
                  minimumSize: Size(230, 45)),
              onPressed: () async {
                await googleData.googleLogIn();
              },
              label: Text("Login with Google")),
          SizedBox(
            height: 7,
          ),
          ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.userGraduate),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber[900],
                  onPrimary: Colors.white,
                  minimumSize: Size(230, 45)),
              onPressed: () {},
              label: Text("Play as Guest")),
        ],
      ),
    );
  }
}
