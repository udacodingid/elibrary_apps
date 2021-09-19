import 'package:elibrary_apps/ui_screen/page_signup.dart';
import 'package:elibrary_apps/utils/bottom_bar_menu.dart';
import 'package:flutter/material.dart';

class PageSignIn extends StatefulWidget {
  @override
  _PageSignInState createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      body: Padding(
        padding: EdgeInsets.only(top: 120, left: 50, right: 50),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset('gambar/logo.png', width: 91, height: 51,),
                  SizedBox(height: 16,),
                  Container(
                    child: Text('SIGN IN ELibrary',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff34A0A4),
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 31),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon:  Icon(Icons.email_outlined),
                        hintText: 'Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 31),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon:  Icon(Icons.lock_outlined),
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                        color: Color(0xff34A0A4),
                      border: Border.all(color : Colors.black26),
                      borderRadius: BorderRadius.circular(8)
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBarMenu()));
                        },
                          child: Text('Sign In',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 50,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an Account ? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                        ),

                        Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageSignUp()));
                            },
                            child: Text('Sign Up',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff34A0A4),
                              ),
                            ),

                          ),
                        )
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
