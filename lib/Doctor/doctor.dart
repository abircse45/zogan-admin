
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool autoValidate = false;
  String DName,speciaList,privateChamberAddress,contactForSerial,chargePerPatient,time;


  void DoctorSendData(){

    if(_key.currentState.validate()){
      _key.currentState.save();

      DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

      var data = {

        "name"  :  DName,
        "specialist" :speciaList,
        "private_chamber_address" :privateChamberAddress,
        "contact_for_serial" :contactForSerial,
        "charge_per_patient" :chargePerPatient,
        "time "  :time,
        "visibility  "  :"1",



      };

      _databaseReference.child("Doctor").push().set(data).then((value){

        _key.currentState.reset();
        Fluttertoast.showToast(
            msg: "Sucessfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );


      });




    }else{

      setState(() {
        autoValidate = true;
      });
    }






  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        body:SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/adminadddetails.jpg"),
                  fit: BoxFit.cover,
                ),
              ),

            child: Form(
              key: _key,
              autovalidate: autoValidate,

              child: ListView(
              children: <Widget>[


                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 200,bottom: 0),
                  child: Image.asset("assets/images/zoganlogo.png",height: 100,width: 100,),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
              height: 50,
              width: 240,
              child: TextFormField(

                  validator: (value){
                    if(value.isEmpty){

                      return "আপনার নাম লিখুন";
                    }
                  },

                  onSaved: (val){
                    DName = val;
                  },

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey[200])
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey[300])
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "নাম",
                      hintStyle: TextStyle(fontSize: 18)

                  ),
              ),
            ),
                ),

            //    SizedBox(height: 10.0,),


                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 55,
                    width: 240,
                    child: TextFormField(

                      validator: (value){
                        if(value.isEmpty){

                          return "";
                        }
                      },

                      onSaved: (val){
                        speciaList  = val;
                      },



                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "বিশেষজ্ঞ",
                          hintStyle: TextStyle(fontSize: 18)

                      ),
                    ),
                  ),
                ),



                SizedBox(height: 10.0,),


                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 70,
                    width: 240,
                    child: TextFormField(
                      maxLines: 2,

                      validator: (value){
                        if(value.isEmpty){

                          return "";
                        }
                      },

                      onSaved: (val){
                        privateChamberAddress = val;
                      },




                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),

                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "ব্যাক্তিগত চেম্বার ঠিকানা ",
                          hintStyle: TextStyle(fontSize: 18)

                      ),

                    ),
                  ),
                ),


                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 50,
                    width: 240,
                    child: TextFormField(


                      validator: (value){
                        if(value.isEmpty){

                          return " ";
                        }
                      },

                      onSaved: (val){
                        contactForSerial = val;
                      },


                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "সিরিয়াল এর জন্য যোগাযোগ",
                          hintStyle: TextStyle(fontSize: 18)

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 50,
                    width: 240,
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      validator: (value){
                        if(value.isEmpty){

                          return " ";
                        }
                      },

                      onSaved: (val){
                        chargePerPatient  = val;
                      },


                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "প্রতি রোগী চার্জ",
                          hintStyle: TextStyle(fontSize: 18)

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 50,
                    width: 240,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,

                      validator: (value){
                        if(value.isEmpty){

                          return " ";
                        }
                      },

                      onSaved: (val){
                        time  = val;
                      },


                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "সময়",
                          hintStyle: TextStyle(fontSize: 18)

                      ),
                    ),
                  ),
                ),



                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: Container(
                    height: 45,
                    width: 240,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16.0),
                      ),

                      child: Text("যোগ করুন ",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                      onPressed: (){

                        DoctorSendData();

                      },
                      color: Colors.grey[500],
                    ),
                  ),

            ),
              ]
            ),
//

                ),
        ),


              ),
    ),

    );



  }
}
