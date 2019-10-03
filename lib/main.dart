import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:type_my_letter/splashScreen.dart';
import 'package:type_my_letter/storedImages.dart';
import './ProfileScreen.dart';





void main() => runApp(MaterialApp(
  title: "Type My letter",
  home:new SplashScreen(),
  debugShowCheckedModeBanner: false,
  routes: <String,WidgetBuilder>{
    '/LoginPage':(BuildContext context)=>new LoginPage(),
    '/StoredImages':(BuildContext context)=>new StoredImages(),
  },


));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  StreamSubscription<FirebaseUser> _listner;
  FirebaseUser _currentUser;

  @override
  void initState(){
    super.initState();
    checkCurrentUser();
  }

  @override
  void displose(){
    _listner.cancel();
    super.dispose();
  }


  @override
  void checkCurrentUser() async{
    _currentUser=await _auth.currentUser();
    _currentUser?.getIdToken(refresh: true);
    _listner=_auth.onAuthStateChanged.listen((FirebaseUser user){
      setState(() {
        _currentUser=user;
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    if(_currentUser==null)
      {
        return Scaffold(
          body: new SignInScreen(


            title: "Type My Letter",

            header: Column(
              children: <Widget>[

                SizedBox(
                  height: 100,
                  width: 100,
                ),
                new Container(padding: const EdgeInsets.symmetric(vertical: 30),
                  child: new Padding(padding: EdgeInsets.all(50),
                    child: Text("Type My Letter.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white
                      ),),
                  ),

                ),
                SizedBox(
                  height: 70,
                  width: 70,
                )
              ],

            ),
            showBar: false,

            bottomPadding: 5,
            avoidBottomInset: true,
            color:Colors.blueAccent.withOpacity(0.7),
            providers:[ProvidersTypes.facebook] ,
            twitterConsumerSecret: "",
            twitterConsumerKey: "",
            horizontalPadding: 12,
          ),
        );
      }

    else{
      return ProfileScreen(_currentUser);

    }
  }

}
