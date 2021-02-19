import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizeapp/ui/home.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()

      //  MyApp(),
      ));
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/gh.png"),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("GENERAL KNOWLEDGE"),
              SizedBox(
                height: 130,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            ],
          )),
    );
  }
}
