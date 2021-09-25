import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:elibrary_apps/utils/constant.dart';
import 'package:flutter/material.dart';

class PagePdfBooks extends StatefulWidget {

  String idBook, bookTitle, pdfFile;

  PagePdfBooks({
    required this.bookTitle, required this.idBook, required this.pdfFile
  });

  @override
  _PagePdfBooksState createState() => _PagePdfBooksState();
}

class _PagePdfBooksState extends State<PagePdfBooks> {
  
  late PDFDocument document;

  loadDocument() async{
    print('book file : ' + widget.pdfFile);
      document = await PDFDocument.fromURL(Constant.PATH_FILE + widget.pdfFile);
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadDocument();
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff34A0A4)),
        title: Text(widget.bookTitle,
            style: TextStyle(color: Color(0xff34A0A4), fontSize: 20)
        ),
      ),
      
      body: Center(
        child: PDFViewer(
          document: document, zoomSteps: 1,
        ),
      ),

    );
  }
}
