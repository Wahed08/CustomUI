import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user  = FirebaseAuth.instance.currentUser!;

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
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            Text("Name: " + user.displayName!, style: TextStyle(fontSize: 16),),
            SizedBox(height: 7,),
            Text(user.email!)
          ],
        ),
      ),
    );
  }
}