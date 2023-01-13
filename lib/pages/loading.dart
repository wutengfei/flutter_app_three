import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

const spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
    duration: const Duration(milliseconds: 1000));

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments;
    Object? data = ModalRoute.of(context)?.settings.arguments;
    String dataString = data as String;
    print(dataString);

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: spinkit,
          ),
          Center(
            child: Text(
              "loading",
              style: TextStyle(color: Colors.red, backgroundColor: Colors.teal),
            ),
          )
        ],
      ),
      backgroundColor: (Colors.blueAccent),
    );
  }
}
