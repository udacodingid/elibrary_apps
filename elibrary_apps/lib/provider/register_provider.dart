import 'package:elibrary_apps/ui_screen/page_signin.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier{

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPass = new TextEditingController();

  bool loading = false;

  RegisterProvider(context){
    postRegiterUser(context);
  }


  Future<void> postRegiterUser(BuildContext context) async{
    loading = true;
    notifyListeners();

    http.Response res = await http.post(Uri.parse(Constant.BASEURL + 'registerUser'),
        body: {
          "user_name" : etUsername.text,
          "email" :etEmail.text,
          "password" : etPass.text,
        }
    );

    if(res.statusCode == 200){

     Navigator.push(context, MaterialPageRoute(builder: (context)=> PageSignIn()));
      loading = false;
      notifyListeners();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Get Data")));
    }
  }
}