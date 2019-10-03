import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/profileDetails.dart';

class ProfileScreen extends StatefulWidget {
  FirebaseUser user;
  ProfileScreen(this.user);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Profile"),
          backgroundColor: Colors.blueAccent.withOpacity(0.7),
          elevation: 0,

        ),
        body: ProfileEditScreen(widget.user),

    );
  }
}

