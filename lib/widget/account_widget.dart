import 'package:e_commerce_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'app_icon.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
 
  AccountWidget({super.key,  required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
             padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20, 
             top: Dimensions.height10, bottom: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: Colors.white,
              boxShadow: [BoxShadow(
              blurRadius: 1, offset: const Offset(0,2),
              color: Colors.grey.withOpacity(0.2)
            )]), 
            child: Row(children: [
              appIcon,
              SizedBox(width: Dimensions.width20,),
              bigText,
            ]),
          );
  }
}