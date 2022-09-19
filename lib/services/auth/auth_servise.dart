import 'dart:convert';

import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user-provider.dart';

import 'package:amazon/utils/conts.dart';
import 'package:amazon/widgets/custrom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
      print(e);
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)['token']);
            // Provider.of<UserProvider>(context,listen:false).setuser.(res.body);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
