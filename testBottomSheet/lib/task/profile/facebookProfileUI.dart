import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user/facebookUser.dart';

class FacebookProfileUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final facebookData = Provider.of<FacebookUser>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
             padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(facebookData.data['picture']['data']['url']),
              ),
            ),
            Text("Name: " + facebookData.data['name'], style: TextStyle(fontSize: 16),),
            SizedBox(height: 7,),
            // Text(user.email!)
          ],
        ),
      ),
    );
  }
}