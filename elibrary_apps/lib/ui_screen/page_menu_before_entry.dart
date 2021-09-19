import 'package:elibrary_apps/ui_screen/page_signin.dart';
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
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ELibrary',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff34A0A4),
                          ),
                        ),

                        Text('Perpustakaan Buku Digital Terkini!',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),

                        SizedBox(height: 15,),
                        Container(
                          width: 320,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: (){
                                  //menuju ke page sign in
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PageSignIn()));
                                },
                                child: Text('Sign IN', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff34A0A4),
                                ),),

                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Container(
                          width: 320,
                          decoration: BoxDecoration(
                              color: Color(0xff34A0A4),
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: (){},
                                child: Text('Sign UP', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),

                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                  )
                ],
              ),

            )

          ],
        ),
      ),
    );
  }
}
