import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'model/khach_hang.dart';

class NextWork {
  static Future<KhachHang> login(String userName, String passWord) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.5:8080/api/khachhangs/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"userName": userName, "passWord": passWord}),
    );
    if (response.statusCode == 200) {
      KhachHang kh = KhachHang.fromJson(jsonDecode(response.body));
      inspect(kh);
      //Shared.setKey("id", "1");
      return kh;
    } else {
      throw Exception("Error Fetch DATA");
    }
  }
}
