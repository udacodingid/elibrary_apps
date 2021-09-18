import 'package:elibrary_apps/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PageSplashScreen extends StatefulWidget {
  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10,), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('',),
            Text('Elibrary')
          ],
        ),
      ),
    );
  }
}
