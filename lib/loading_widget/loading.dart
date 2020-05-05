import 'package:flutter/material.dart';
    import 'package:flutter_spinkit/flutter_spinkit.dart';

      class LoadingWidget extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return Container(
            color: Colors.blue[100],
            child: Center(
              child: SpinKitChasingDots(
                color: Colors.grey,
                size: 50.0,
              ),

            ),
          );
        }
      }
