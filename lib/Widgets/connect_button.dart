import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConnectButton extends StatelessWidget {

  final VoidCallback onPressed;
  String buttonName;
  Color color;

ConnectButton({
    Key? key,
    required this.w,
    required this.h,
    required this.onPressed,
    required this.buttonName,
    required this.color
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: w * 0.8,
        height: h * 0.05,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(child: Text(buttonName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
      ),
    );
  }
}