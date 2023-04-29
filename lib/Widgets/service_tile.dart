// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {

  String title, subtitle, path;
  Color color;

  ServiceTile({
    Key? key,
    required this.w,
    required this.title,
    required this.subtitle,
    required this.path,
    required this.color
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      width: w,
      
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(path)),
        title: Text(title),
        subtitle: Text(subtitle),
        
      ));
  }
}