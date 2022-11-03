import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_icon.dart';
import 'package:e_commerce_app/widget/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/big_text.dart';

class RecommendedFoodDetails extends StatefulWidget {
  const RecommendedFoodDetails({super.key});

  @override
  State<RecommendedFoodDetails> createState() => _RecommendedFoodDetailsState();
}

class _RecommendedFoodDetailsState extends State<RecommendedFoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelpers.getInitial());
              },
              child: AppIcon(icon: Icons.clear,)),
            AppIcon(icon: Icons.shopping_cart_outlined,),
          ],),
          backgroundColor: AppColors.yellowColor,
          pinned: true,
          bottom: PreferredSize(preferredSize: const Size.fromHeight(0),
          child: Container(
            padding: EdgeInsets.all(Dimensions.height5),
            margin:const EdgeInsets.all(0.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20))
            
            ),
            child: Center(
               child: BigText(text: "Chinese App bar ", size: Dimensions.font16,)),
            
           
          ),),
          expandedHeight: 300, 
          flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("assets/images/tart.jpg", 
          width: double.maxFinite, fit: BoxFit.cover,),
          ),
        ),
         SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
            child: const ExpandableText(text: "shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar shubham kumar ",))
        ),
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20*2.5, vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AppIcon(icon: Icons.remove, size: Dimensions.iconSize24, 
            backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
            BigText(text: "\$12.88"+" X "+ "0 ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
             AppIcon(icon: Icons.add, size: Dimensions.iconSize24, 
            backgroundColor: AppColors.mainColor, iconColor: Colors.white,),

          ],),
        ),
        Container(
      height: Dimensions.bottombarsize,
      padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20*2),
      topRight: Radius.circular(Dimensions.radius20*2),
      
      ),
      color: AppColors.buttonBackgroundColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
          padding: EdgeInsets.all(Dimensions.width20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
           color: Colors.white,
          ),
         child: 
          Icon(Icons.favorite, color: AppColors.mainColor, size: Dimensions.iconSize24,),
         
        
        ),
        Container(
          padding: EdgeInsets.all(Dimensions.width20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.mainColor
          ),
          child: BigText(text: "\$0.08 | Add to cart", color: Colors.white, size: Dimensions.font16,) 
        ),
      ],),
     ),
        
      ]),
    );
  }
}