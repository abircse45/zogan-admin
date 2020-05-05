
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BusPage extends StatefulWidget {
  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool autoValidate = false;
  String BName,BType,BForm,bTo,BRoute,bTime,BMobile;

  void BusSendData(){


    if(_key.currentState.validate()){
      _key.currentState.save();

      DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

      var data = {

        "name"  :  BName,
        "type" :BType,
        "form" :BForm,
        "to" :bTo,
        "route" :BRoute,
        "time" : bTime,
        "mobile" : BMobile,
        "visibility " : "1",


      };

      _databaseReference.child("Bus").push().set(data).then((value){

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
                    BName = val;
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
                      labelText: "নাম",
                      labelStyle: TextStyle(fontSize: 18)

                  ),
              ),
            ),
                ),



            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 240,
                child: TextFormField(

                  validator: (value){
                    if(value.isEmpty){

                      return "";
                    }
                  },

                  onSaved: (val){
                    BType  = val;
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
                      labelText: "টাইপ ",
                      labelStyle: TextStyle(fontSize: 18)

                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),








            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 240,
                child: TextFormField(

                  validator: (value){
                    if(value.isEmpty){

                      return "";
                    }
                  },

                  onSaved: (val){
                    BForm   = val;
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
                      hintText: " Form ",
                      hintStyle: TextStyle(fontSize: 18)

                  ),
                  keyboardType: TextInputType.number,

                ),
              ),
            ),



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
                    bTo = val;
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
                      hintText: " To ",
                      hintStyle: TextStyle(fontSize: 18)

                  ),
                ),
              ),
            ),






            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 240,
                child: TextFormField(


                  validator: (value){
                    if(value.isEmpty){

                      return "  ";
                    }
                  },

                  onSaved: (val){
                    BRoute  = val;
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
                    hintText: " Route ",
                    hintStyle: TextStyle(fontSize: 18),

                  ),
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 240,
                child: TextFormField(


                  validator: (value){
                    if(value.isEmpty){

                      return "  ";
                    }
                  },

                  onSaved: (val){
                    bTime  = val;
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
                    hintStyle: TextStyle(fontSize: 18),

                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 250,
                child: TextFormField(
                  keyboardType: TextInputType.phone,

                  validator: (value){
                    if(value.isEmpty){

                      return "  ";
                    }
                  },

                  onSaved: (val){
                    BMobile  = val;
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
                    hintText: "মোবাইল",
                    hintStyle: TextStyle(fontSize: 18),

                  ),
                ),
              ),
            ),

            







            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: Container(
                height: 50,
                width: 240,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16.0),
                  ),

                  child: Text("যোগ করুন ",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                  onPressed: (){

                    BusSendData();

                  },
                  color: Colors.grey[500],
                ),
              ),
            )
              ]
            ),
          ),
        ),
      ),


    );
  }
}
