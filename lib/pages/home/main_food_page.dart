import 'package:e_commerce_app/pages/home/food_page_body.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';

import '../../utils/dimension.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height40,bottom: Dimensions.height10),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                     children: [
                     BigText(text: "India", color: AppColors.mainColor,),
                     
                     Row(children: [
                        SmallText(text: "Sasaram", color: Colors.black54,),
                        const Icon(Icons.arrow_drop_down_rounded)
                     ],)
                   ],
                 ),
                 Container(
                   width: Dimensions.width45,
                   height: Dimensions.height45,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15), color: AppColors.mainColor),
                   child:  Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                 )
               ],
             ),
           ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
      
    );
  }
}