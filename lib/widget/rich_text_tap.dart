import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../utils/colors.dart';
import '../utils/dimension.dart';

class RichTextTap extends StatelessWidget {
  final String text;
  final String linktext;
  final TapGestureRecognizer recognizer;
  final double? size;

 const RichTextTap({super.key, required this.text, required this.linktext, required this.recognizer, this.size});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(text:text, style: TextStyle(color: Colors.grey[500], fontFamily: "Roboto", fontSize: Dimensions.font16),
       children: [
       TextSpan(
        recognizer: recognizer,
         text: linktext, style: TextStyle(color: AppColors.mainColor, fontFamily: "Roboto", fontSize: Dimensions.font16, fontWeight: FontWeight.w500),)
            ]
          ),
            );
  }
}