import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async{
    var _duration=new Duration(seconds: 2);
    return new Timer(_duration,navigationPage);

  }

  void navigationPage(){
    Navigator.of(context).pushReplacementNamed('/LoginPage');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(59, 89, 152, 1),
              gradient: LinearGradient(colors:[ Color.fromRGBO(59, 89, 152, 1),Colors.lightBlueAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Type My Letter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
