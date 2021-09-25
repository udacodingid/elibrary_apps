// To parse this JSON data, do
//
//     final modelAddBook = modelAddBookFromJson(jsonString);

import 'dart:convert';

ModelAddBook modelAddBookFromJson(String str) => ModelAddBook.fromJson(json.decode(str));

String modelAddBookToJson(ModelAddBook data) => json.encode(data.toJson());

class ModelAddBook {
  ModelAddBook({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory ModelAddBook.fromJson(Map<String, dynamic> json) => ModelAddBook(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.idBook,
    required this.idUserReader,
    required  this.uuidFile,
    required this.openBookAt,
  });

  String idBook;
  String idUserReader;
  String uuidFile;
  String openBookAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idBook: json["id_book"],
    idUserReader: json["id_user_reader"],
    uuidFile: json["uuid_file"],
    openBookAt: json["open_bookAt"],
  );

  Map<String, dynamic> toJson() => {
    "id_book": idBook,
    "id_user_reader": idUserReader,
    "uuid_file": uuidFile,
    "open_bookAt": openBookAt,
  };
}
