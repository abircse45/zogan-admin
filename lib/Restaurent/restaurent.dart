import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RestaurentPage extends StatefulWidget {
  @override
  _RestaurentPageState createState() => _RestaurentPageState(
  );
}

class _RestaurentPageState extends State<RestaurentPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool autoValidate = false;
  String rName,rPhone,rMobile,rAddress, rTime,rFoodMenu;

  void RestaurentSendData(){

    if(_key.currentState.validate()){
      _key.currentState.save();

      DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

      var data = {

        "name"  :  rName,
        "phone" :rPhone,
        "mobile" :rMobile,
        "address" :rAddress,
        "time" :rTime,
        "food_menu" :rFoodMenu,
        "visibility " :"1",
      };

      _databaseReference.child("Restaurant").push().set(data).then((value){

        _key.currentState.reset();
        Fluttertoast.showToast(
            msg: "Successfully ",
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
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,

      body: Container(
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
                padding: const EdgeInsets.only(top: 40,right: 200,bottom: 0),
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
                  rName = val;
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

      //    SizedBox(height: 20.0,),


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
                  rPhone  = val;
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



      //    SizedBox(height: 20.0,),


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
                  rMobile = val;
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


     //     SizedBox(height: 20.0,),







          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
            child: Container(
              height: 60,
              width: 250,
              child: TextFormField(
maxLines: 2,

                validator: (value){
                  if(value.isEmpty){

                    return "আপনার  ঠিকানা দিন ";
                  }
                },

                onSaved: (val){
                  rAddress = val;
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


       //   SizedBox(height: 20.0,),


          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
            child: Container(
              height: 50,
              width: 250,
              child: TextFormField(

keyboardType: TextInputType.datetime,
                validator: (value){
                  if(value.isEmpty){

                    return " সময় নির্বাচন করুন ";
                  }
                },

                onSaved: (val){
                  rTime  = val;
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
                    labelText: " সময়  ",
                    labelStyle: TextStyle(fontSize: 18)

                ),
              ),
            ),
          ),




      //    SizedBox(height: 20.0,),


          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
            child: Container(
              height: 50,
              width: 250,
              child: TextFormField(


                validator: (value){
                  if(value.isEmpty){

                    return "আপনার খাবারের ছবির লিংক দিন ";
                  }
                },

                onSaved: (val){
                  rFoodMenu = val;
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
                    labelText: "ছবি লিংক  ",
                    labelStyle: TextStyle(fontSize: 18)

                ),
              ),
            ),
          ),



      //    SizedBox(height: 40.0,),

          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 40),
            child: Container(
              height: 45,
              width: 240,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16.0),
                ),

                child: Text("যোগ করুন ",style: TextStyle(fontSize: 18.0,color: Colors.white),),
                onPressed: (){

                  RestaurentSendData();

                },
                color: Colors.grey[500],
              ),
            ),

          ),

          ]
        ),
      ),

      ),

    );
  }
}
