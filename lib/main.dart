import 'package:flutter/material.dart';
import 'package:flutterzogan/Blood/Blood.dart';
import 'package:flutterzogan/home/home_page.dart';
import 'package:flutterzogan/login/login_page.dart';
void main() => runApp(MyApp());

      class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),

          );
        }
      }

