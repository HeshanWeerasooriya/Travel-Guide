import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class DataServies {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  getInfo() async {
    var apiUrl = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
