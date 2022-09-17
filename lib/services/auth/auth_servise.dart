import 'dart:convert';

import 'package:amazon/models/user.dart';
import 'package:amazon/utils/conts.dart';
import 'package:amazon/widgets/custrom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../error/error_handling.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http
          .post(Uri.parse('$uri/api/signup'), body: jsonEncode(user), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(res.body);

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Accoutn created!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
