// To parse this JSON data, do
//
//     final modelHistoryReadBooks = modelHistoryReadBooksFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelHistoryReadBooks modelHistoryReadBooksFromJson(String str) => ModelHistoryReadBooks.fromJson(json.decode(str));

String modelHistoryReadBooksToJson(ModelHistoryReadBooks data) => json.encode(data.toJson());

class ModelHistoryReadBooks {
  ModelHistoryReadBooks({
     required this.message,
    required this.status,
    required this.data,
  });

  String message;
  int status;
  List<DatumHistory> data;

  factory ModelHistoryReadBooks.fromJson(Map<String, dynamic> json) => ModelHistoryReadBooks(
    message: json["message"],
    status: json["status"],
    data: List<DatumHistory>.from(json["data"].map((x) => DatumHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumHistory {
  DatumHistory({
    required this.idReadersBook,
    required this.idBook,
    required this.uuidFile,
    required this.idUserReader,
    required this.openBookAt,
    required this.closeBookAt,
    required this.idUser,
    required this.userName,
    required this.email,
    required this.password,
    required this.address,
    required this.fotoUser,
    required this.idLevelUser,
    required this.idDepartmen,
    required this.sex,
    required this.tglCreateUser,
    required this.idLibraryBooks,
    required this.bookTitle,
    required this.bookCover,
    required this.bookFile,
    required this.bookDesc,
    required this.totalPages,
    required this.language,
    required this.releaseAt,
    required this.penulis,
    required this.bookCreatedBy,
    required this.bookCreatedAt,
  });

  String idReadersBook;
  String idBook;
  String uuidFile;
  String idUserReader;
  String openBookAt;
  String closeBookAt;
  String idUser;
  String userName;
  String email;
  String password;
  String address;
  String fotoUser;
  String idLevelUser;
  String idDepartmen;
  String sex;
  String tglCreateUser;
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

  factory DatumHistory.fromJson(Map<String, dynamic> json) => DatumHistory(
    idReadersBook: json["id_readers_book"],
    idBook: json["id_book"],
    uuidFile: json["uuid_file"],
    idUserReader: json["id_user_reader"],
    openBookAt: json["open_bookAt"],
    closeBookAt: json["close_bookAt"],
    idUser: json["id_user"],
    userName: json["user_name"],
    email: json["email"],
    password: json["password"],
    address: json["address"],
    fotoUser: json["foto_user"],
    idLevelUser: json["id_level_user"],
    idDepartmen: json["id_departmen"],
    sex: json["sex"],
    tglCreateUser: json["tgl_create_user"],
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
    "id_readers_book": idReadersBook,
    "id_book": idBook,
    "uuid_file": uuidFile,
    "id_user_reader": idUserReader,
    "open_bookAt": openBookAt,
    "close_bookAt": closeBookAt,
    "id_user": idUser,
    "user_name": userName,
    "email": email,
    "password": password,
    "address": address,
    "foto_user": fotoUser,
    "id_level_user": idLevelUser,
    "id_departmen": idDepartmen,
    "sex": sex,
    "tgl_create_user": tglCreateUser,
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
