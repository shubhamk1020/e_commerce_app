import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimension.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';


class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});
 

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          BigText(text: text,),
          SizedBox(height: Dimensions.height10,),
          Row(children: [
            Wrap(children: 
              List.generate(5, (index) {return Icon(Icons.star, 
              color: AppColors.mainColor, size: 12,);
              }),
            ),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "1287"),
            SizedBox(width: Dimensions.width5,),
            SmallText(text: "comments"),
          ],
          ),
  
          SizedBox(height: Dimensions.height10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconAndText(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
            IconAndText(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor),
            IconAndText(icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.iconColor2),
      
          ],)
  
        ]);
      
  }
}