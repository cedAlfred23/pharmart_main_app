import 'dart:async';

import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _isVisible ? 1.0 : 0.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isVisible = false;
          });
        },
        child: Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
            child: Text('This is a bottom sheet'),
          ),
        ),
      ),
    );
  }

  void showBottomSheet() {
    setState(() {
      _isVisible = true;
    });
    Timer(const Duration(seconds: 10), () {
      setState(() {
        _isVisible = false;
      });
    });
  }
}
