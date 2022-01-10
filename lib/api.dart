import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class API {
  static Future getUsers() async {
    final urlApi =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (urlApi.statusCode != 200) {
      print('Erro');
    } else {
      return urlApi;
    }
  }
}
