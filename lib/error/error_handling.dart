import 'dart:convert';

import 'package:amazon/widgets/custrom_snackbar.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

void httpErrorHandling(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['err']);
      break;
    default:
    showSnackBar(context, jsonDecode(response.body));
  }
}
