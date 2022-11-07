
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/pages/popular_food_details.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_icon.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(" height   ---" + MediaQuery.of(context).size.width.toString());

     return Scaffold(
      body: Stack(children: [
          Positioned(
            left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelpers.getInitial());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios, backgroundColor: AppColors.mainColor, iconColor: Colors.white,)),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelpers.getInitial());
                  },
                  child: AppIcon(icon: Icons.home_outlined, backgroundColor: AppColors.mainColor, iconColor: Colors.white)),
                AppIcon(icon: Icons.shopping_cart, backgroundColor: AppColors.mainColor, iconColor: Colors.white)
          ],
          ),
          ),

          Positioned(
            left: Dimensions.width15, right: Dimensions.width15, bottom: 0, top: Dimensions.height20*4,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (controller) {
              var _cartList = controller.getItems;
                return ListView.builder(
                itemCount: _cartList.length,
                itemBuilder: (context , index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height5),
                  height: Dimensions.height20*5,
                   width: double.maxFinite,
                   child: Row(
                    children: [

                  GestureDetector(
                    onTap: (){
                      var popularIndex  = Get.find<PopularProductController>()
                      .popularProductList
                      .indexOf(_cartList[index].product);
                      if(popularIndex>=0){
                        Get.toNamed(RouteHelpers.getPopularFood(popularIndex,"cart_page" ));
                      }else{
                        var recommendedIndex = Get.find<RecommendedProductController>()
                        .recommendedProductList
                        .indexOf(_cartList[index].product);
                        Get.toNamed(RouteHelpers.getRecommendedFood(recommendedIndex, "cart_page"));
                      }
                    },
                    child: Container(
                      height: Dimensions.height10*10, width: Dimensions.height10*10,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20), 
                      image:  DecorationImage(image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + controller.getItems[index].img!), fit: BoxFit.cover),
                      ),
                     ),
                  ),
                    
                    SizedBox(width: Dimensions.width10,),
                   Expanded(
                     child: SizedBox(
                      height: Dimensions.height20*5,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: controller.getItems[index].name!, color: Colors.black54,),
                           SmallText(text: "testy"),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            BigText(text: "\u{20B9} ${controller.getItems[index].price!*74}" ,color: Colors.red,),
                           
                          Container(
                          padding: EdgeInsets.all(Dimensions.width10/1.2),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15),
                           color: Colors.white,
                          ),
                         child: Row(children: [
                          GestureDetector(
                                 onTap: (){
                                  controller.addItem(_cartList[index].product!, -1);
                                 },
                                 child: Icon(Icons.remove, color: AppColors.signColor, size: Dimensions.iconSize16,)),
                          SizedBox(width: Dimensions.width5,),
                          BigText(text: _cartList[index].quantity.toString(),),
                          SizedBox(width: Dimensions.width5,),
                          GestureDetector(
                                 onTap: () {
                                  controller.addItem(_cartList[index].product!, 1);
                                 },
                                 child: Icon(Icons.add, color: AppColors.signColor,size: Dimensions.iconSize16,))
                         ],),
                        ),
                           
                         
                                
                           ],)
                        ],
                       ),
                     ),
                   )
                   ]),
                  
                );
              });
            
              },)),
            ),  
          
    ],),

       bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
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
          SizedBox(width: Dimensions.width5,),
          BigText(text: "\u{20B9} "+cartController.totalAmount.toString(), size: Dimensions.font16,),
          SizedBox(width: Dimensions.width5,),
        
         ],),
        ),
       
        Container(
          padding: EdgeInsets.all(Dimensions.width20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.mainColor
          ),
          child: GestureDetector(
            onTap: () {
              
            },
            child: BigText(text: "Check out", color: Colors.white, size: Dimensions.font16,)) 
        ),
      ],),
     );
    
     })
     );
 
  
      }
    }