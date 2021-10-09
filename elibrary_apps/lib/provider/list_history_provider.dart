import 'package:elibrary_apps/model/model_history_read_books.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListHistoryReadBooksProvider extends ChangeNotifier{


  List<DatumHistory> listData = [];

  bool loading = false;

  ListHistoryReadBooksProvider(context){
    getHistoryBooks(context);
  }


  Future<void> getHistoryBooks(BuildContext context) async{
    loading = true;
    notifyListeners();

    http.Response res = await http.post(Uri.parse(Constant.BASEURL + 'historyBacaBuku'),
      body: {
        "id_user_reader" : "2"
      }
    );

    if(res.statusCode == 200){
      List<DatumHistory> dataHistoryList = modelHistoryReadBooksFromJson(res.body).data;

      listData = dataHistoryList;
      loading = false;
      notifyListeners();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Get Data")));
    }


  }
}