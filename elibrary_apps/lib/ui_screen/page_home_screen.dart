import 'package:elibrary_apps/provider/list_books_provider.dart';
import 'package:elibrary_apps/ui_screen/detail_page.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PageHomeScreen extends StatefulWidget {
  @override
  _PageHomeScreenState createState() => _PageHomeScreenState();
}

class _PageHomeScreenState extends State<PageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ListBooksProvider(context),

      child: Consumer<ListBooksProvider>(
        builder: (context, listbooksprovider, _) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text('Elibrary',
              style: TextStyle(color: Color(0xff34A0A4), fontSize: 20),

            ),
          ),

          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 225,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listbooksprovider.listData.length,
                  itemBuilder: (context, index){
                    var itemBook = listbooksprovider.listData[index];

                    return Card(
                      child: InkWell(
                        //button bisa d klik
                        //inkwell gesture detecture
                        onTap: (){
                          //pindah page
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PageDetailBooks(
                            index: index,
                            listData: listbooksprovider.listData,
                          )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15, left: 18, right: 18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),

                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Image.network(Constant.PATH_IMAGE + itemBook.bookCover,
                                      width: 108,
                                      height: 146,
                                    ),

                                    Text(itemBook.bookTitle, style: TextStyle(color: Color(0xff34A0A4),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                    Text(itemBook.penulis, style: TextStyle(fontSize: 11),),
                                    Text('Total Pages : ' + itemBook.totalPages,
                                        style: TextStyle(fontSize: 8)
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
