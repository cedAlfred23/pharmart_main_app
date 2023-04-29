import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  AuthButton({
    Key? key,
    required this.w,
    required this.h,
    required this.authType,
    required this.path
  }) : super(key: key);

  final double w;
  final double h;
  String path;
  String authType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: w * 0.8,
        height: h * 0.05,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(path),
          Text('Continue with $authType', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black.withOpacity(0.5)),)
        ]),
      ),
    );
  }
}