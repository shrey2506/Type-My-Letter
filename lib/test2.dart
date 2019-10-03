import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class ProfileDetails extends StatefulWidget {

  FirebaseUser user;
  ProfileDetails(this.user);
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _bio;
  DateTime _selectDate;
  int selectedRadio;
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }


  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate==null){
        return;
      }
      setState(() {
        _selectDate=pickedDate;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child:
      Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent.withOpacity(0.7),
        child: Stack(
          children: <Widget>[

            Positioned(
              left: 10,
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width-20,
              top:  MediaQuery.of(context).size.height*0.15,

              child: SingleChildScrollView(
                child: Card(

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),



                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          initialValue: '${widget.user.displayName}',
                          decoration:InputDecoration (
                              border: OutlineInputBorder(),
                              labelText: "Name",
                              filled: true,
                              hintText: 'What do people call you ?',
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(59, 89, 152, 1)
                              )
                          ),
                          onSaved: (String value){
                            this._name=value;
                          },
                          validator: validateName,
                        ),
                      ),




                      Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Male:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.blue,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                            ),
                            Text("Female:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.blue,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                            ),
                            Text("Other:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Radio(
                              value: 3,
                              groupValue: selectedRadio,
                              activeColor: Colors.blue,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                            ),
                          ],
                        ),
                      ),

                      Card(
                        elevation: 5,
                        child: Container(

                          decoration: BoxDecoration(
                            color:Colors.white,
                          ),
                          child: FlatButton(
                              color: Colors.white,

                              textColor: Color.fromRGBO(59, 89, 152,1),
                              child: Text(_selectDate==null ?'Select Birthday'
                                  :'Birthday: ${DateFormat('MMMM dd, yyyy').format(_selectDate)}',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                              onPressed: _presentDatePicker),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: TextFormField(
                          decoration: const InputDecoration (
                              border:OutlineInputBorder(),
                              labelText: "Bio",
                              filled: true,
                              hintText: 'Tell Us About Yourself',
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(59, 89, 152, 1)
                              )
                          ),
                          maxLines: 3,
                          onSaved: (String value){
                            this._bio=value;
                          },
                          validator: validateName,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed('/StoredImages');
                            _validateInputs();
                          },
                          child: Text(" Update Profile",style: TextStyle(
                            color:Colors.white ,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          color:Color.fromRGBO(59, 89, 152, 1) ,
                          elevation: 5,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width*0.3,
              top: 10,
              child:  Container(
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
            )
          ],
        ),
      ),


    );

  }
}
