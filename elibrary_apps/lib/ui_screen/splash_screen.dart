import 'package:elibrary_apps/main.dart';
import 'package:elibrary_apps/ui_screen/page_menu_before_entry.dart';
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
    Timer(Duration(seconds: 5,), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PageMenuEntry())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff34A0A4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('gambar/logo.png', width: 91, height: 65,),
            SizedBox(height: 3,),
            Text('Elibrary - Perpusatakaan Digital', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20

            ),)
          ],
        ),
      ),
    );
  }
}
