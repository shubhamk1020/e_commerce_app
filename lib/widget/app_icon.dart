import 'package:e_commerce_app/utils/dimension.dart';
import 'package:flutter/cupertino.dart';


class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({super.key, required this.icon, 
  this.backgroundColor = const Color(0xFFfcf4e4), this.iconColor = const Color(0xFF756d54), this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
          color: backgroundColor,),
          child: Icon(icon, size: Dimensions.iconSize16, color: iconColor,),

    );

  }
  
}