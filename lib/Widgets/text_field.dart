import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldInput extends StatelessWidget {
   TextFieldInput({

    Key? key,
    required this.keyBoardType,
    required this.w,
    required this.fieldController,
    required this.texthint, 
    // required Function(dynamic e) onChanged
  }) : super(key: key);

  final double w;
  String texthint;
  final TextEditingController fieldController;
  // ignore: prefer_typing_uninitialized_variables
  final keyBoardType;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: w * 0.9,
        child: TextField(
          keyboardType: keyBoardType,
    controller: fieldController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none,
      hintText: texthint,
      hintStyle: const TextStyle(fontSize: 12)
      // prefixIcon: Icon(Icons.mail, color: Colors.grey.shade300, size: 20,)
      ),
        ),
      ),
    );
  }
}