import 'dart:convert';

import 'package:bookapiflutter/models/book.dart';

import 'book_api_url.dart' as url;
import 'http_status.dart' as status;
import 'package:http/http.dart' as http;

class BookApiController {
  Future getBooks() async {
    http.Response response = await http.get(url.getBooks);
    if (response.statusCode == status.OK) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load getBooks");
    }
  }

  Future getBook(String bookId) async {
    http.Response response = await http.get("${url.getBook}$bookId");
    if (response.statusCode == status.OK) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load getBook $bookId");
    }
  }

  Future createBook(Book book) async {
    Map<String, String> reqHeader = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String reqBody = jsonEncode(<String, String>{
      'title': book.title,
      'author': book.author,
      'pages': book.pages,
    });
    http.Response response = await http.post(url.createBook, headers: reqHeader, body: reqBody);
    if (response.statusCode == status.CREATED) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to post createBook");
    }
  }

  Future updateBook(Book book) async {
    Map<String, String> reqHeader = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String reqBody = jsonEncode(<String, String>{
      'title': book.title,
      'author': book.author,
      'pages': book.pages,
    });
    http.Response response = await http.put("${url.putBook}${book.id}", headers: reqHeader, body: reqBody);
    if (response.statusCode == status.OK) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to put putBook");
    }
  }

  Future removeBook(String bookId) async {
    Map<String, String> reqHeader = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    http.Response response = await http.delete("${url.removeBook}$bookId", headers: reqHeader);
    if (response.statusCode == status.OK) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to removeBook");
    }
  }
}
