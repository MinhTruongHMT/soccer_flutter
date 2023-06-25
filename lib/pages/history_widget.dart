import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_final_aplication/shared_preferences.dart';
import '../model/donhang.dart';

class HistoryWidget extends StatefulWidget {
  HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List<DonHang> donHangs = [];
  final String? id = Shared.getString('id');
  Future<List<DonHang>> getListDonHang() async {
    final response = await http
        .get(Uri.parse('http://192.168.0.98:8080/api/khachhangs/bookings/$id'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      inspect(response.body);
      for (Map i in data) {
        donHangs.add(DonHang.fromJson(i));
      }
      return donHangs;
    } else {
      return donHangs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: FutureBuilder(
                future: getListDonHang(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Load data");
                  } else {
                    return ListView.builder(
                        itemCount: donHangs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(children: [
                              Text(donHangs[index].id.toString()),
                              Text(donHangs[index].bookingDate.toString())
                            ]),
                          );
                        });
                  }
                }),
          ),
        ),
      ),
    );
  }
}
