import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

        class HotelPage extends StatefulWidget {
          @override
          _HotelPageState createState() => _HotelPageState();
        }

        class _HotelPageState extends State<HotelPage> {



          GlobalKey<FormState> _key = GlobalKey<FormState>();
          bool autoValidate = false;
          String hName,hPhone,hMobile,HAddress,hDetails;

          void HotelSendData(){


            if(_key.currentState.validate()){
              _key.currentState.save();

              DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();


              var data = {

                "name"  :  hName,
                "phone" :hPhone,
                "mobile" :hMobile,
                "address" :HAddress,
                "details" :hDetails,
                "visibility" :"1",


              };

              _databaseReference.child("Hotel").push().set(data).then((value){

                _key.currentState.reset();
                Fluttertoast.showToast(
                    msg: "Successfull ",
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
            return Scaffold(
              resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: true,

              body:
                SafeArea(
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
                            padding: const EdgeInsets.only(top: 30,right: 200,bottom: 0),
                            child: Image.asset("assets/images/zoganlogo.png",height: 100,width: 100,),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                          child: Container(
                          height: 50,
                          width: 250,
                          child: TextFormField(

                            validator: (value){
                              if(value.isEmpty){

                                return "আপনার নাম লিখুন";
                              }
                            },

                            onSaved: (val){
                              hName = val;
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

              //        SizedBox(height: 10.0,),


                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                        child: Container(
                          height: 50,
                          width: 250,
                          child: TextFormField(

                            validator: (value){
                              if(value.isEmpty){

                                return "আপনার ফোন নাম্বার দিন";
                              }
                            },

                            onSaved: (val){
                              hPhone  = val;
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
                                hintText: "ফোন ",
                                hintStyle: TextStyle(fontSize: 18)

                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),



                  //    SizedBox(height: 10.0,),


                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                        child: Container(
                          height: 50,
                          width: 250,
                          child: TextFormField(

                            validator: (value){
                              if(value.isEmpty){

                                return "আপনার মোবাইল নাম্বার লিখুন";
                              }
                            },

                            onSaved: (val){
                              hMobile = val;
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
                                hintText: " মোবাইল",
                                hintStyle: TextStyle(fontSize: 18)

                            ),
                            keyboardType: TextInputType.phone,

                          ),
                        ),
                      ),


             //         SizedBox(height: 10.0,),







                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                        child: Container(
                          height: 50,
                          width: 250,
                          child: TextFormField(


                            validator: (value){
                              if(value.isEmpty){

                                return "আপনার ঠিকানা দিন ";
                              }
                            },

                            onSaved: (val){
                              HAddress = val;
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
                                hintText: "ঠিকানা  ",
                                hintStyle: TextStyle(fontSize: 18)

                            ),
                          ),
                        ),
                      ),

              //        SizedBox(height: 10.0,),


                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                        child: Container(

                          height: 80,
                          width: 255,
                          child: TextFormField(
                            maxLines: 3,

                            validator: (value){
                              if(value.isEmpty){

                                return "আপনার ঠিকানা দিন ";
                              }
                            },

                            onSaved: (val){
                              hDetails = val;
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
                              hintText: " বিস্তারিত লিখুন ",
                              hintStyle: TextStyle(fontSize: 18),

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

                              HotelSendData();

                            },
                            color: Colors.grey[500],
                          ),
                        ),

                      ),
                      ]
                    ),
                  ),

              ),
                ),

            );
          }
        }
