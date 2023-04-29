import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  String path, text;
  // ignore: slash_for_doc_comments
  /**
   * This is more or less like a model for the intro page
   * It requires the image path as well as the text to be displayed on the intro pages
   * It is then used by the onboarding screen to be displayed
   */
  
  IntroPage({super.key, required this.path, required this.text, 
  // required this.pad
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
      children: [
        const Spacer(),
        Image.asset(path),
        // SizedBox(height: pad,),
        Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),),
        const Spacer()
      ],
            ),
    );
  }
}