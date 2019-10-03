
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class StoredImages extends StatefulWidget {
  @override
  _StoredImagesState createState() => _StoredImagesState();
}

class _StoredImagesState extends State<StoredImages> {
  int _counter = 6;

  void logOut() {
    signOutProviders();
    Navigator.of(context).pushReplacementNamed('/LoginPage');
    Toast.show("Signed Out!", context, duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM);
  }

  void _incrementCounter() {
     if(_counter>1) {
       setState(() {
         _counter--;
       });
     }
     else{
       Toast.show("No More Images to delete in the stack", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
     }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Images"),
        elevation: 0,
        backgroundColor:  Colors.blueAccent.withOpacity(0.7),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: logOut,
          )
        ],
      ),
      body:SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          //height: MediaQuery.of(context).size.height,
         // width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent.withOpacity(0.7),
          child: Column(
                 children: <Widget>[
                   (_counter==1)?Container():Card(
                     elevation: 5,
                     color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         Text("First Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Container(
                           height: 250,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('http://wallpaperheart.com/wp-content/uploads/2018/04/Thailand_island-beautiful-scenery-HD-wallpaper-scenery-hd-wallpaper.jpg'),
                         ),
                         ),
          ),
                       ],
                     ),
                   ),

                   (_counter<=2)?Container():Card(
                     elevation: 5,
                     color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         Text("Second Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Container(
                           height: 250,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chat-app-47986.appspot.com/o/images%2F1.jpg?alt=media&token=6fe3d266-644d-4447-9225-437ee514f1ac'),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   (_counter<=3)?Container():Card(
                     elevation: 5,
                     color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         Text("Third Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Container(
                           height: 250,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chat-app-47986.appspot.com/o/images%2F2.jpg?alt=media&token=bdd65c78-3846-43d4-b731-f62e311afc67'),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   (_counter<=4)?Container():Card(
                     elevation: 5,
                     color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         Text("Fourth Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Container(
                           height: 250,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chat-app-47986.appspot.com/o/images%2F3.jpg?alt=media&token=1cb8b99e-14eb-4362-9006-304ecd977d3f'),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   (_counter<=5)?Container():Card(
                     elevation: 5,
                     color: Colors.white,
                     child: Column(
                       children: <Widget>[
                         Text("Fifth Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Container(
                           height: 250,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chat-app-47986.appspot.com/o/images%2F4.jpeg?alt=media&token=ba382290-89f9-4435-8331-2389c7d4ff9d'),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),

                 ],
               ),
        ),

      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete,color: Colors.white,),
        hoverElevation: 10,
        backgroundColor: Color.fromRGBO(59, 89, 152,1),
        onPressed:_incrementCounter,
        tooltip: 'Increment',
      ),
    );
  }
}
