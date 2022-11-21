import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_icon.dart';
import 'package:e_commerce_app/widget/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../widget/big_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

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
                if(page == "cart_page"){
                  Get.toNamed(RouteHelpers.getInitial());
                }
                else{
                  Get.toNamed(RouteHelpers.getCartPage()); 
                }
                },
              child: const AppIcon(icon: Icons.clear,)),

              GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                           onTap: () {
                            if(controller.totalItems>=1)
                           Get.toNamed(RouteHelpers.getCartPage());
                          },
                    child: Stack(children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined,),
                        controller.totalItems>=1?
                         Positioned(
                          right: 0, top: 0,
                          child: AppIcon(icon: Icons.circle, 
                         backgroundColor: AppColors.mainColor, size: 20, 
                         iconColor: Colors.transparent,),)
                         
                            :Container(),
                           controller.totalItems>=1?Positioned(
                              right: 4, top: 4,
                             child: BigText(text: controller.inCartItems.toString(), size: 12,),
                              )
                              : Container(),
                    ],),
                  );
              }),

           
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
               child: BigText(text: product.name!, size: Dimensions.font16,)),
            
           
          ),),
          expandedHeight: 300, 
          flexibleSpace: FlexibleSpaceBar(
          background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!, 
          width: double.maxFinite, fit: BoxFit.cover,),
          ),
        ),
         SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
            child:  ExpandableText(text: product.description!,))
        ),
      ]),
      
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
      
        mainAxisSize: MainAxisSize.min,
        children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20*2.5, vertical: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                controller.setQuantity(false);
              },
              child: AppIcon(icon: Icons.remove, size: Dimensions.iconSize24, 
              backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
            ),
            BigText(text: "\u{20B9} ${product.price*74} x ${controller.inCartItems} ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
             GestureDetector(
              onTap: (){
                controller.setQuantity(true);
              },
               child: AppIcon(icon: Icons.add, size: Dimensions.iconSize24, 
                         backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
             ),

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
        GestureDetector(
          onTap: (){
            controller.addItem(product);
          },
          child: Container(
            padding: EdgeInsets.all(Dimensions.width20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: AppColors.mainColor
            ),
            child: BigText(text: "\u{20B9} ${product.price*74} | Add to cart", color: Colors.white, size: Dimensions.font16,) 
          ),
        ),
      ],),
     ),
        
      ]);
    

      })
    );
  }
}