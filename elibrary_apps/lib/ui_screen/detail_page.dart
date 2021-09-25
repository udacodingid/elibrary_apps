import 'package:elibrary_apps/model/model_add_book.dart';
import 'package:elibrary_apps/model/model_list_books.dart';
import 'package:elibrary_apps/ui_screen/page_pdfbook.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class PageDetailBooks extends StatefulWidget {
  int index;
  List<Datum> listData = [];

  PageDetailBooks({required this.index, required this.listData});

  @override
  _PageDetailBooksState createState() => _PageDetailBooksState();
}

class _PageDetailBooksState extends State<PageDetailBooks> {
  var uuiDReaders;

  Future<ModelAddBook?> addBookReadres() async {
    uuiDReaders = Uuid();
    var unReadFile = uuiDReaders.v4();

    final responseData =
        await http.post(Uri.parse(Constant.BASEURL + 'addBooksReader'), body: {
      "id_user_reader": "2",
      "id_book": widget.listData[widget.index].idLibraryBooks,
      "uuid_file": unReadFile.toString()
    });

    if (responseData.statusCode == 200) {
      print("Berhasi add data");
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff34A0A4)),
        title: Text(widget.listData[widget.index].bookTitle,
            style: TextStyle(color: Color(0xff34A0A4), fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 7, left: 35, right: 35),
                        child: Image.network(
                          Constant.PATH_IMAGE +
                              widget.listData[widget.index].bookCover,
                          width: 196,
                          height: 288,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        height: 89,
                        padding: EdgeInsets.only(top: 11, left: 5, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.listData[widget.index].bookTitle,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.listData[widget.index].penulis,
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Page : ' +
                                        widget
                                            .listData[widget.index].totalPages,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff34A0A4)),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4.0',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff34A0A4),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xff34A0A4),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xff34A0A4),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xff34A0A4),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xff34A0A4),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Container(
                      // height: 495,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Book Detail',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Format : ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Hardcopy & Softcopy',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Pages Total : ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.listData[widget.index].totalPages,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Language : ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.listData[widget.index].language,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Release : ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  widget.listData[widget.index].releaseAt,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Sinopsis : ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.listData[widget.index].bookDesc,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 154,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    color: Color(0xff34A0A4),
                    onPressed: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 154,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    color: Color(0xff34A0A4),
                    onPressed: () {

                      setState(() {
                        addBookReadres();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PagePdfBooks(
                                    bookTitle:
                                    widget.listData[widget.index].bookTitle,
                                    idBook: widget
                                        .listData[widget.index].idLibraryBooks,
                                    pdfFile:
                                    widget.listData[widget.index].bookFile)));
                      });

                    },
                    child: Text(
                      'Read Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
