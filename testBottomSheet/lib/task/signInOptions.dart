import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test/task/ProfileUI.dart';
import 'package:test/task/FacebookProfileUI.dart';
import './googleUser.dart';
import './facebookUser.dart';

class SignInOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final googleData = Provider.of<GoogleUser>(context, listen: false);
    final facebookData = Provider.of<FacebookUser>(context, listen: false);

    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.facebookF),
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[600],
                  onPrimary: Colors.white,
                  minimumSize: Size(230, 45)),
              onPressed: () async {
                  // ignore: await_only_futures
                  await facebookData.facebookLogIn();
                  fbbuildProfile();
                Navigator.of(context).pushNamed('/fbprofile');
              },
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
                buildProfile();
                Navigator.of(context).pushNamed('/profile');
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

  Widget buildProfile() => ProfileUI();
  Widget fbbuildProfile() => FacebookProfileUI();
}
