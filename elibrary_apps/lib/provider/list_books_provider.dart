import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:elibrary_apps/model/model_list_books.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListBooksProvider extends ChangeNotifier{

  List<Datum> listData = [];

  bool loading = false;

  ListBooksProvider(context){
    getListBooks(context);
  }


  Future<void> getListBooks(BuildContext context) async{
    loading = true;
    notifyListeners();

    http.Response res = await http.get(Uri.parse(Constant.BASEURL + 'getDataBooks'));

    if(res.statusCode == 200){
      List<Datum> dataBooksList = modelListBooksFromJson(res.body).data;

      listData = dataBooksList;
      loading = false;
      notifyListeners();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Get Data")));
    }


  }
}