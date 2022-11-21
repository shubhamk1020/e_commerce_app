import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;

   SmallText({Key? key, this.color= const Color(0xFFccc7c5), required this.text, this.size = 12,
     this.height = 1.2, this.overflow= TextOverflow.ellipsis}): super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Text(text, 
    style: TextStyle(
      height: height,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: color, fontSize: size, ),
    );
  }
}