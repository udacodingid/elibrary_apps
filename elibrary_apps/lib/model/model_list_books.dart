// To parse this JSON data, do
//
//     final modelListBooks = modelListBooksFromJson(jsonString);

import 'dart:convert';

ModelListBooks modelListBooksFromJson(String str) => ModelListBooks.fromJson(json.decode(str));

String modelListBooksToJson(ModelListBooks data) => json.encode(data.toJson());

class ModelListBooks {
  ModelListBooks({
     required this.message,
    required this.status,
    required this.data,
  });

  String message;
  int status;
  List<Datum> data;

  factory ModelListBooks.fromJson(Map<String, dynamic> json) => ModelListBooks(
    message: json["message"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required  this.idLibraryBooks,
    required this.bookTitle,
    required this.bookCover,
    required this.bookFile,
    required this.bookDesc,
    required this.totalPages,
    required this.language,
    required  this.releaseAt,
    required this.penulis,
    required  this.bookCreatedBy,
    required this.bookCreatedAt,
  });

  String idLibraryBooks;
  String bookTitle;
  String bookCover;
  String bookFile;
  String bookDesc;
  String totalPages;
  String language;
  String releaseAt;
  String penulis;
  String bookCreatedBy;
  String bookCreatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idLibraryBooks: json["id_library_books"],
    bookTitle: json["book_title"],
    bookCover: json["book_cover"],
    bookFile: json["book_file"],
    bookDesc: json["book_desc"],
    totalPages: json["total_pages"],
    language: json["language"],
    releaseAt: json["release_at"],
    penulis: json["penulis"],
    bookCreatedBy: json["book_created_by"],
    bookCreatedAt: json["book_createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id_library_books": idLibraryBooks,
    "book_title": bookTitle,
    "book_cover": bookCover,
    "book_file": bookFile,
    "book_desc": bookDesc,
    "total_pages": totalPages,
    "language": language,
    "release_at": releaseAt,
    "penulis": penulis,
    "book_created_by": bookCreatedBy,
    "book_createdAt": bookCreatedAt,
  };
}
