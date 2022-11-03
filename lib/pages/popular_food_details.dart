import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_column.dart';
import 'package:e_commerce_app/widget/app_icon.dart';
import 'package:e_commerce_app/widget/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_helpers.dart';
import '../utils/colors.dart';
import '../widget/big_text.dart';



class PopularFoodDetails extends StatelessWidget {
 final int pageId;
  const PopularFoodDetails({required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct();
    print("height of windowns " + MediaQuery.of(context).size.height.toString());
    print("windows of windowns " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.white,
     body: Stack(children: [
      Positioned(
      left: 0,
      right: 0,
      child: Container(height: Dimensions.popularImageSize,
      width: double.infinity,
      margin: const EdgeInsets.all(0.0),
      decoration:  BoxDecoration(image: DecorationImage(image: 
      NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!), fit: BoxFit.cover)),
      ),
     ),

     Positioned(
      left: Dimensions.width20, 
      right: Dimensions.width20, 
      top: Dimensions.height45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelpers.getInitial()); 
          },
          child: AppIcon(icon: Icons.arrow_back_ios)),
        AppIcon(icon: Icons.shopping_cart_outlined) ], 
          )),
   

     Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: Dimensions.popularImageSize-20,
      child: Container(
        padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20)
        ),
        color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppColumn(text: product.name!,),
            SizedBox(height: Dimensions.height20),
            BigText(text: "Introduce"),
            SizedBox(height: Dimensions.height10,),
            Expanded(
              child: SingleChildScrollView(
              child: ExpandableText(text: product.description!)))
          ],
        )
      ),
      ),
    
     ]),
     bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProducts){
        return Container(
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
         child: Row(children: [
          GestureDetector(
            onTap: (){
              popularProducts.setQuantity(false);
            },
            child: Icon(Icons.remove, color: AppColors.signColor, size: Dimensions.iconSize16,)),
          SizedBox(width: Dimensions.width5,),
          BigText(text: popularProducts.quantity.toString(), size: Dimensions.font16,),
          SizedBox(width: Dimensions.width5,),
          GestureDetector(
            onTap: () {
              popularProducts.setQuantity(true);
            },
            child: Icon(Icons.add, color: AppColors.signColor,size: Dimensions.iconSize16,))
         ],),
        ),
        Container(
          padding: EdgeInsets.all(Dimensions.width20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.mainColor
          ),
          child: BigText(text: "\u{20B9} ${product.price*74*popularProducts.quantity} | Add to cart", color: Colors.white, size: Dimensions.font16,) 
        ),
      ],),
     );
    
     }));
  }
}