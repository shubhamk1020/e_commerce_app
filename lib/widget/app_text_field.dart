import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/dimension.dart';

class AppTextField extends StatelessWidget {
   final TextEditingController textController;
   final String hintText;
   final IconData icon;
   final Color? color;
   bool isObscure;

   AppTextField({super.key, required this.textController, required this.hintText, required this.icon, this.color, this.isObscure = false});
   

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: Dimensions.height10/2),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1,1),
              color: Colors.grey.withOpacity(0.2),
              
            )
          ]),
          child: TextField(
            obscureText: isObscure?true:false,
            controller: textController, decoration: InputDecoration(hintText: hintText, prefixIcon: Icon(icon, color: AppColors.mainColor,),
        // focusBorder 
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: const BorderSide(color: Colors.white, width: 1.0)
          
          ),
          //enable border 
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide:const BorderSide(color: Colors.white, width: 1.0)
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius15))
 ),
         
         ),
         
         );
      
  }
}