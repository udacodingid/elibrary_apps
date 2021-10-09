import 'dart:core';

import 'package:elibrary_apps/provider/list_history_provider.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

class PageHistoryReadBooks extends StatefulWidget {
  @override
  _PageHistoryReadBooksState createState() => _PageHistoryReadBooksState();
}

class _PageHistoryReadBooksState extends State<PageHistoryReadBooks> {

  String nTime = "";

   String convertToAgo(DateTime input){
    Duration diff = DateTime.now().difference(input);

    if(diff.inDays >= 1){
      nTime = '${diff.inDays} day(s) ago';
      return '${diff.inDays} day(s) ago';


    } else if(diff.inHours >= 1){
      nTime = '${diff.inHours} hour(s) ago';
      return '${diff.inHours} hour(s) ago';
    } else if(diff.inMinutes >= 1){
      nTime = '${diff.inMinutes} minute(s) ago';
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1){
      nTime = '${diff.inSeconds} second(s) ago';
      return '${diff.inSeconds} second(s) ago';
    } else {
      nTime = 'Just Now';
      return 'just now';
    }
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ListHistoryReadBooksProvider(context),
      child: Consumer<ListHistoryReadBooksProvider>(
        builder: (context, listbooksprovider, _) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xff34A0A4)),
            centerTitle: true,
            title: Text(
              'History',
              style: TextStyle(color: Color(0xff34A0A4)),
            ),
            actions: [
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.more_vert, color: Color(0xff34A0A4)))
            ],
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.all(6),
              child: ListView.builder(
                  itemCount: listbooksprovider.listData.length,
                  itemBuilder: (context, index) {
                    var itemBook = listbooksprovider.listData[index];


                    // var inputFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
                    // var inputDate = inputFormat.parse(itemBook.openBookAt); // <-- dd/MM 24H format
                    //
                    // var outputFormat = DateFormat('yyyy-MM-dd hh:mm a');
                    // var outputDate = outputFormat.format(inputDate);
                    // DateTime timeOpen = DateTime.parse(outputDate);

                    DateTime tempDate = new DateFormat("dd-MM-yyyy HH:mm:ss").parse(itemBook.openBookAt);

                    print(tempDate);

                      Duration diff = DateTime.now().difference(tempDate);

                      if(diff.inDays >= 1){
                        nTime = '${diff.inDays} day(s) ago';


                      } else if(diff.inHours >= 1){
                        nTime = '${diff.inHours} hour(s) ago';

                      } else if(diff.inMinutes >= 1){
                        nTime = '${diff.inMinutes} minute(s) ago';

                      } else if (diff.inSeconds >= 1){
                        nTime = '${diff.inSeconds} second(s) ago';

                      } else {
                        nTime = 'Just Now';

                      }




                    return Card(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 11, left: 26, right: 17),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Image.network(Constant.PATH_IMAGE + itemBook.bookCover,
                                  width: 45,
                                  height: 66,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemBook.bookTitle),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.open_in_new_outlined, color: Color(0xff34A0A4),
                                        size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Opened at: ' + itemBook.openBookAt,
                                          style: TextStyle(
                                            fontSize: 10
                                          ),
                                        )

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.close, color: Color(0xff34A0A4),
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Closed at : ' + itemBook.closeBookAt,
                                          style: TextStyle(
                                              fontSize: 10
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.alarm, color: Color(0xff34A0A4),
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Times : ' + nTime,
                                          style: TextStyle(
                                              fontSize: 10
                                          ),
                                        )
                                      ],
                                    ),

                                    SizedBox(
                                      height: 11,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),

                    );
                  }
                  // children: [

                  // ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
