import 'package:flutter/material.dart';

class CustomTextfild extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  const CustomTextfild(
      {Key? key, required this.controller, required this.hinText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hinText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter ypur $hinText';
        } else {
          return null;
        }
      },
    );
  }
}
