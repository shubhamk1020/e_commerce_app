import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText({super.key, required this.icon, required this.text, required this.iconColor});
 

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, color: iconColor, size: Dimensions.iconSize24,),
       SizedBox(width: Dimensions.width5,),
      SmallText(text: text),
    ],);
  }
}