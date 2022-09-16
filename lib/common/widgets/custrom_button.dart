import 'dart:math';

import 'package:flutter/material.dart';

class CustromButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const CustromButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
