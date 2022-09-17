import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: ElevatedButton(
                onPressed: () async {
                  http.Response res = await http.post(
                      Uri.parse(
                          'https://zubair-bhuian.herokuapp.com/api/signup'),
                      body:jsonEncode( {
                        "name": "zubair",
                        "email": "bhuias@outlfdook.com",
                        "password": "123456"
                      }),
                      headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                      });
                  print(res.body);
                },
                child: const Text('Click')))
      ]),
    );
  }
}
