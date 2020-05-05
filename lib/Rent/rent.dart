

        import 'package:flutter/material.dart';

        class RentPage extends StatefulWidget {
          @override
          _RentPageState createState() => _RentPageState();
        }

        class _RentPageState extends State<RentPage> {
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text(""),

              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/adminadddetails.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),


              ),
            );
          }
        }
