import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  final String text;
  const SnackBarPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(text));
  }
}