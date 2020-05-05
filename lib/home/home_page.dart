
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterzogan/Ambulance/ambulance.dart';
import 'package:flutterzogan/Auth/authenticate.dart';
import 'package:flutterzogan/Blood/Blood.dart';
import 'package:flutterzogan/Bus/bus.dart';
import 'package:flutterzogan/Doctor/doctor.dart';
import 'package:flutterzogan/Hospital/hospital.dart';
import 'package:flutterzogan/Prosashon/prosashon.dart';
import 'package:flutterzogan/Rent/rent.dart';
import 'package:flutterzogan/Restaurent/restaurent.dart';
import 'package:flutterzogan/User/user.dart';
import 'package:flutterzogan/hotel/hotel.dart';


        class HomePage extends StatefulWidget {
          @override
          _HomePageState createState() => _HomePageState();
        }

        class _HomePageState extends State<HomePage> {


          final FirebaseAuth _auth = FirebaseAuth.instance;
          FirebaseUser loggedInUser;
         // User user;





//          Future getCurrentUser() async {
//            try {
//              final user = await _auth.currentUser();
//              if (user != null) {
//                loggedInUser = user;
//                print("logged in user is ${loggedInUser.email}");
//
//                Navigator.pushReplacement(
//                  context,
//                  MaterialPageRoute(builder: (context) => HomePage()),
//                );
////        Firestore.instance
////            .collection('users')
////            .document(loggedInUser.uid)
////            .get()
////            .then((DocumentSnapshot ds) {
////          setState(() {
////            var fname = ds.data["fname"];
////            var lname = ds.data["lname"];
////            var phone = ds.data["phone"];
////            var email = ds.data["email"];
////          });
////          // use ds as a snapshot
////        });
//              } else {
//                print("user is null");
//              }
//              setState(() {});
//            } catch (e) {
//              print(e);
//            }
//          }
//
//          @override
//          void initState() {
//            // TODO: implement initState
//            super.initState();
//            getCurrentUser();
//          }



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
                      image: AssetImage("assets/images/mainhome.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView(

                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.only(top: 30,left: 180,bottom: 0),
                        child: Image.asset("assets/images/zoganlogo.png",height: 100,width: 100,),
                      ),

                      Container(
                        height: 220,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,width: 2,


                          ),

                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // eikhne
                            Row(
//                                    mainAxisAlignment: MainAxisAlignment
//                                        .spaceBetween,
                              children: <Widget>[
                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 23,left: 23,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("রক্ত",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BloodPage()));
                                  },


                                ),



                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 3,left: 3,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("  এ্যাম্বুলেন্স ",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                AmbulancePage()));
                                  },


                                ),






                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8,left: 13,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("হোটেল",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                HotelPage()));
                                  },

                                ),

                              ],
                            ),

                            //   2nd part

                            SizedBox(height: 15.0,),

                            Row(

                              children: <Widget>[
                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 7,left: 7,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("হসপিটাল",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                HospitalPage()));
                                  },


                                ),

                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 13,left: 13,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("ডাক্তার ",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                DoctorPage()));
                                  },


                                ),
                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8,left: 13,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("প্রসাশন",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ProshasionPage()));
                                  },


                                ),

                              ],
                            ),

                            // 3rd part
                            SizedBox(height: 15.0,),
                            Row(

                              children: <Widget>[
                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 23,left: 23,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("রেস্ত্যরা",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                RestaurentPage()));
                                  },


                                ),

                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 13,left: 13,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text(" বাস ",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BusPage()));
                                  },


                                ),
                                FlatButton(
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8,left: 13,top: 3,bottom: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 2),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),

                                      child: Text("রেন্ট",
                                        style: TextStyle(fontSize: 19.0,
                                        ),),
                                    ),
                                  ),
                                  //  color: Colors.orange,
                                  onPressed: () {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodPage()  ));
                                    //       Navigator.push(context, CupertinoPageRoute(build(context)=>))

                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                RentPage()));
                                  },


                                ),

                              ],
                            ),


                          ],
                        ),
                      ),

                      SizedBox(height: 30.0,),

                      Container(
                        height: 220,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,width: 2,


                          ),

                          borderRadius: BorderRadius.circular(30),

                        ),

                      ),
                    ],


                  ),
                ),
              ),

            );

          }

        }
