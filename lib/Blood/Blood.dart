

        import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
        import 'package:flutter/material.dart';
      import 'package:fluttertoast/fluttertoast.dart';


    class BloodPage extends StatefulWidget {
      @override
      _BloodPageState createState() => _BloodPageState();
    }

    class _BloodPageState extends State<BloodPage> {


    GlobalKey<FormState> _key = GlobalKey<FormState>();
    bool autoValidate = false;


    String name,bloodDropDown,phoneNumber,gender,age,address;
    List<DropdownMenuItem<String>>  items= [
      
      DropdownMenuItem(child: Text("A+"),
      value: "A+",
      ),
      DropdownMenuItem(child: Text("B+"),   value: "B+",),
      DropdownMenuItem(child: Text("A-"),   value: "A-",),
      DropdownMenuItem(child: Text("B-"),   value: "B-",),
      DropdownMenuItem(child: Text("O+"), value: "O+",),
      DropdownMenuItem(child: Text("O-"),value: "O-",),
      DropdownMenuItem(child: Text("AB+"),value: "AB+",),
      DropdownMenuItem(child: Text("Ab-"),value: "AB-",),


    ];

    List<DropdownMenuItem<String>>  genderItem =[
      DropdownMenuItem(child: Text("ছেলে"),   value: "ছেলে",),
      DropdownMenuItem(child: Text("মেয়ে"),   value: "মেয়ে ",),

    ];


            void sendData(){

                  if(_key.currentState.validate()){
                    _key.currentState.save();

                    DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

                    var data = {

                       "name"  :  name,
                      "blood_group" :bloodDropDown,
                       "mobile " :phoneNumber,
                      "gender"  :gender,
                       "age"  :age,
                        "address" :address,
                        "visibility " :"1",


                    };

                    _databaseReference.child("Blood").push().set(data).then((value){



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
//
//    void showShortToast() {
//
//
//      Fluttertoast.showToast(
//          msg: "This is Short Toast",
//          toastLength: Toast.LENGTH_SHORT,
//          timeInSecForIosWeb: 1);
//    }

      @override
      Widget build(BuildContext context) {
        return Scaffold(

          resizeToAvoidBottomPadding: false,


          body:  SafeArea(


            child: Container(
              child: ListView(
                children: <Widget>[
                  headerImageSection(),
                  textFieldSection(),
                  buttonSection(),

                ],
              ),
            ),


//            child:
//
//            Stack(
//              fit: StackFit.expand,
//              children: <Widget>[
//
//                Container(
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      image: AssetImage("assets/images/adminadddetails.jpg",),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                  child:SingleChildScrollView(
//                    child: Column(
//                      children: <Widget>[
//
//                        Image.asset("assets/images/zoganlogo.png",height: 100,width: 100,),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
//                          child: Container(
//                            height: 50,
//                            width: 240,
//                            child: TextFormField(
//                              validator: (value){
//                                if(value.isEmpty){
//                                  return "আপনার নাম লিখুন";
//                                }
//                              },
//
//                              onSaved: (val){
//                                name = val;
//                              },
//
//                              decoration: InputDecoration(
//                                  enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[200])
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[300])
//                                  ),
//                                  filled: true,
//                                  fillColor: Colors.grey[100],
//                                  hintText: "নাম",
//                                  hintStyle: TextStyle(fontSize: 19)
//
//                              ),
//                            ),
//                          ),
//                        ),
//
//                        SizedBox(height: 20,),
//
//// name
//
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40,right: 40),
//                          child: Container(
//                            height: 50,
//                            width: 240,
//                            child: TextFormField(
//
//                              validator: (val){
//                                if(val.isEmpty){
//                                  return 'আপনার বয়স লিখুন';
//                                }
//                              },
//
//                              onSaved: (val){
//                                age = val;
//                              },
//
//
//                              decoration: InputDecoration(
//                                  enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[200])
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[300])
//                                  ),
//                                  filled: true,
//                                  fillColor: Colors.grey[100],
//                                  hintText: "বয়স",
//                                  hintStyle: TextStyle(fontSize: 18)
//
//                              ),
//                              keyboardType: TextInputType.number,
//                            ),
//                          ),
//                        ),
////  blood group and gender
//
//                        SizedBox(height: 22,),
//
//                        Row(
//
//                          children: <Widget>[
//
//                            SizedBox(width: 50,),
//
//                            Container(
//                                decoration: BoxDecoration(
//
//                                  borderRadius: BorderRadius.circular(5.0),
//
//                                ),
//
//                                child: Padding(
//                                  padding: const EdgeInsets.all(5.0),
//                                  child: Text("রক্ত গ্রুপ",style: TextStyle(fontSize: 17),),
//                                )),
//
//                            SizedBox(width: 15.0,),
//
//
//                            DropdownButtonHideUnderline(
//
//                              child: DropdownButton(
//                                items: items,
//                                value: bloodDropDown,
//                                onChanged: (val){
//
//                                  setState(() {
//                                    bloodDropDown = val;
//                                  });
//
//
//                                },
//                                //    hint: Text("A+"),
//
//
//                              ),
//                            ),
//
//
//                            //    dropdownhobe
//
//                            Container(
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(5.0),
//
//                                ),
//
//                                child: Padding(
//                                  padding: const EdgeInsets.all(5.0),
//                                  child: Text("লিঙ্গ",style: TextStyle(fontSize: 17),),
//                                )),
//
//                            SizedBox(width: 15.0,),
//
//                            DropdownButtonHideUnderline(
//
//                              child: DropdownButton(
//
//                                items: genderItem,
//                                value: gender,
//                                //   hint: Text("ছেলে"),
//                                onChanged: (value){
//                                  setState(() {
//                                    gender  = value;
//
//
//                                  });
//                                },
//                              ),
//                            ),
//
//
//                          ],
//                        ),
//                        /// address
//                        ///
//                        ///
//                        SizedBox(height: 20,),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40,right: 40),
//                          child: Container(
//                            height: 65,
//                            width: 250,
//                            child: TextFormField(
//                              maxLines: 1,
//
//
//                              validator: (val){
//                                if(val.isEmpty){
//                                  return 'আপনার ঠিকানা  লিখুন';
//                                }
//                              },
//
//                              onSaved: (val){
//                                address = val;
//                              },
//
//
//                              decoration: InputDecoration(
//                                  enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[200])
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[300])
//                                  ),
//                                  filled: true,
//                                  fillColor: Colors.grey[100],
//                                  hintText: "ঠিকানা",
//                                  hintStyle: TextStyle(fontSize: 18)
//
//                              ),
//                            ),
//                          ),
//                        ),
//
//// mobile
//                        SizedBox(height: 20,),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40,right: 40),
//                          child: Container(
//                            height: 50,
//                            width: 250,
//                            child: TextFormField(
//                              keyboardType: TextInputType.phone,
//
//
//
//                              validator: (val){
//                                if(val.isEmpty){
//                                  return 'আপনার নাম্বার  লিখুন';
//                                }
//                              },
//
//                              onSaved: (val){
//                                phoneNumber = val;
//                              },
//
//
//
//                              decoration: InputDecoration(
//                                  enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[200])
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                                      borderSide: BorderSide(color: Colors.grey[300])
//                                  ),
//                                  filled: true,
//                                  fillColor: Colors.grey[100],
//                                  hintText: "মোবাইল নাম্বার",
//                                  hintStyle: TextStyle(fontSize: 18)
//
//                              ),
//                            ),
//                          ),
//                        ),
//
//
//
//                        SizedBox(height: 40.0,),
//
//
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40,right: 40),
//                          child: Container(
//                            height: 45,
//                            width: 240,
//                            child: RaisedButton(
//                              shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(16.0),
//                              ),
//
//                              child: Text("যোগ করুন ",style: TextStyle(fontSize: 18.0,color: Colors.white),),
//                              onPressed: (){
//
//                                sendData();
//
//                              },
//                              color: Colors.grey[500],
//                            ),
//                          ),
//                        ),
//
//
//                      ],
//                    ),
//                  ) ,
//                ),
//
//
////              Image.asset("assets/images/adminadddetails.jpg",fit: BoxFit.cover,),
//
//                ],
//            ),
          ),

            );

      }

      Container textFieldSection(){

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: Column(
                  children: <Widget>[

                    TextFormField(
              //        controller: nameController,


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
                          hintText: "Name"

                      ),
                    ),
                    SizedBox(height: 20.0),






                    TextFormField(
                  //    controller: remailController,

                      obscureText: true,

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
                          hintText: "Email"

                      ),
                    ),

                    SizedBox(height: 20.0),


                    TextFormField(
                   //   controller: phoneController,

                      obscureText: true,

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
                          hintText: "phone"

                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextFormField(
                 //     controller: rpasswordController,

                      obscureText: true,

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
                          hintText: "Password"

                      ),
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                  //    controller: passwordconfirmationController,

                      obscureText: true,

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
                          hintText: "Password_Confirmation"

                      ),
                    ),

                  ],
                ),
              );


      }



      Container headerImageSection() {
        return Container(
          margin: EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Text("Covid_19",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 43.0,
                  fontWeight: FontWeight.bold)),
        );
      }





      Container   buttonSection(){


              return Container(

              );

      }














    }
