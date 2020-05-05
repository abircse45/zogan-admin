

        import 'package:firebase_database/firebase_database.dart';
      import 'package:flutter/material.dart';
      import 'package:fluttertoast/fluttertoast.dart';

          class AmbulancePage extends StatefulWidget {
            @override
            _AmbulancePageState createState() => _AmbulancePageState();
          }

          class _AmbulancePageState extends State<AmbulancePage> {

            GlobalKey<FormState> _key = GlobalKey<FormState>();
            bool autoValidate = false;
            String aName,aPhone,aMobile,aAddress;


            List<DropdownMenuItem<String>>  AvisibiltyItem =
            [
              DropdownMenuItem(
                child: Text("1"),
                value: "1",
              ),
              DropdownMenuItem(
                child: Text("0"),
                value: "0",
              ),

            ];

            void ASendData(){

              if(_key.currentState.validate()){
                _key.currentState.save();

                DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

                var data = {

                  "name"  :  aName,
                  "phone" :aPhone,
                  "mobile" :aMobile,
                  "address" :aAddress,
                  "visibility" :"1",
                };

                _databaseReference.child("Ambulance").push().set(data).then((value){

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
                              width: 240,
                              child: TextFormField(

                                validator: (value){
                                  if(value.isEmpty){

                                    return "আপনার নাম লিখুন";
                                  }
                                },

                                onSaved: (val){
                                  aName = val;
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
                                  //  labelText: "নাম",
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
                              height: 50,
                              width: 240,
                              child: TextFormField(

                                validator: (value){
                                  if(value.isEmpty){

                                    return "আপনার ফোন নাম্বার দিন";
                                  }
                                },

                                onSaved: (val){
                                  aPhone  = val;
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



                //        SizedBox(height: 10.0,),


                          Padding(
                            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                            child: Container(
                              height: 50,
                              width: 240,
                              child: TextFormField(

                                validator: (value){
                                  if(value.isEmpty){

                                    return "আপনার মোবাইল নাম্বার লিখুন";
                                  }
                                },

                                onSaved: (val){
                                  aMobile = val;
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


                          //SizedBox(height: 10.0,),

                          Padding(
                            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                            child: Container(
                              height: 60,
                              width: 240,
                              child: TextFormField(
                                maxLines: 3,

                                validator: (value){
                                  if(value.isEmpty){

                                    return "আপনার ঠিকানা দিন ";
                                  }
                                },

                                onSaved: (val){
                                  aAddress = val;
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


                          SizedBox(height: 20.0,),

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

                                  ASendData();

                                },
                                color: Colors.grey[500],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                  ),
                ),


            );
            }
          }
