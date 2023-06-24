import 'package:flutter/material.dart';

class KhachHang extends ChangeNotifier {
  int? id;
  String? userName;
  String? passWord;
  String? phone;
  String? image;

  set setId(int sid) {
    id = sid;
    notifyListeners();
  }

  int? get getId => id;

  KhachHang({
    this.id,
    this.userName,
    this.passWord,
    this.phone,
    this.image,
  });

  KhachHang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    passWord = json['passWord'];
    phone = json['phone'];
    image = json['image'];
  }
}
