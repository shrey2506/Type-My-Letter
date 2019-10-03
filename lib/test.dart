import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';

class ProfileDetails extends StatefulWidget {
  FirebaseUser user;
  ProfileDetails(this.user);
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            color: Colors.blueAccent.withOpacity(0.7),
          ),
          clipper: getClipper(),
        ),
        Positioned(
          width: 350.0,
          top:MediaQuery.of(context).size.height/14,
          child: Column(
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoUrl),
                    fit:BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7,color: Colors.black),],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(widget.user.displayName, style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(59, 89, 152, 1)
                  ),),
                  Container(

                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: (){},
                        child:Center(
                          child: IconButton(icon: Icon(Icons.edit),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Gender", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(59, 89, 152, 1)
                  ),),
                  Container(

                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: (){},
                        child:Center(
                          child: IconButton(icon: Icon(Icons.edit),),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("BirthDay", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(59, 89, 152, 1)
                  ),),
                  Container(

                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: (){},
                        child:Center(
                          child: IconButton(icon: Icon(Icons.edit),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Tell us About Yourself", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(59, 89, 152, 1)
              ),),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/HomePage');
            },
            child: Text(" Update Profile",style: TextStyle(
              color:Colors.white ,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            color:Colors.blueAccent.withOpacity(0.7) ,
            elevation: 5,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )
      ],
    );

  }
}
class getClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=new Path();
    path.lineTo(0.0, size.height/1.9);
    path.lineTo(size.width+110, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
