import 'package:flutter/material.dart';

class PageMenuEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('gambar/bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          //child : 1 widget
          //children : lebih 1 widget
          children: [
            Container(
              padding: EdgeInsets.only(top: 450, left: 20, right: 20),

            )

          ],
        ),
      ),
    );
  }
}
