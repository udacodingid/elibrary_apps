import 'dart:convert';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagePdfBooks extends StatefulWidget {

  String idBook, bookTitle, pdfFile, nUuidFIle;

  PagePdfBooks({
    required this.bookTitle, required this.idBook, required this.pdfFile, required this.nUuidFIle
  });

  @override
  _PagePdfBooksState createState() => _PagePdfBooksState();
}

class _PagePdfBooksState extends State<PagePdfBooks> {
  
  late PDFDocument? document;
  bool _isLoading = true;
  var idPdfCloseAt;

  loadDocument() async{
    print('book file : ' + widget.pdfFile);
      document = await PDFDocument.fromURL(Constant.PATH_FILE + widget.pdfFile);
    print('book file : ' + Constant.PATH_FILE + widget.pdfFile);
    setState(() {
      _isLoading = false;
    });
  }

  updateDataCloseAt() async{
    final responseData = await http.post(Uri.parse(Constant.BASEURL + "updateCloseTimeReader",
    ),
      body: {
      "uuid_file" : widget.nUuidFIle
      }
    );

    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      if(data['message'] == 'Successfully Update'){
        setState(() {
          Navigator.pop(context);
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed Update Data")));
      }
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadDocument();
       idPdfCloseAt = widget.nUuidFIle;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff34A0A4)),
        title: Text(widget.bookTitle,
            style: TextStyle(color: Color(0xff34A0A4), fontSize: 20)
        ),

        actions: [
          IconButton(onPressed: (){
            setState(() {
              updateDataCloseAt();
            });
          }, icon: Icon(Icons.close, color : Color(0xff34A0A4)))
        ],
      ),
      
      body: Center(
        child: _isLoading ? Center(
          child: CircularProgressIndicator(),
        ) :PDFViewer(
          document: document!, zoomSteps: 1,
        ),
      ),

    );
  }
}
