import 'dart:convert';
import 'package:e_commerce_app/base/no_data-page.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

  class CartHistory extends StatelessWidget {
    const CartHistory({super.key});

    @override
    Widget build(BuildContext context) {
    
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    
    Map<String, int> cartItemsPerOrder = Map();
    for(int i=0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
            
        }else {
          cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
        }
         }
        List<int> cartItemsPerOrderToList(){
          return cartItemsPerOrder.entries.map((e) => e.value).toList();
        }

        List<String> cartOrderTimeToList(){
          return cartItemsPerOrder.entries.map((e) => e.key).toList();
        }
        List<int> itemsPerOrder = cartItemsPerOrderToList();

        var listCounter=0;

        Widget timeWidget(int index){
          var outputDate = DateTime.now().toString();
          if(index<getCartHistoryList.length){
             DateTime parseDate =  DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
              var inputDate = DateTime.parse(parseDate.toString());
              var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
              outputDate = outputFormat.format(inputDate);
          }
          
              return BigText(text: outputDate);
        }

       return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height30, vertical: Dimensions.width5*5),
          decoration: BoxDecoration(color: AppColors.mainColor),
          child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(
            flex: 1,
            child: BigText(text: "Cart History", color: Colors.white,)),
            const Icon(Icons.shopping_cart_checkout_rounded, color: Colors.white,)
                ],)),

       GetBuilder<CartController>(builder: (cartController){
        var cartLength = cartController.getCartHistoryList();
        return cartLength.isNotEmpty? 
        Expanded(
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
             padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.height20, right: Dimensions.height20),
            children: [
              for(int i=0; i<itemsPerOrder.length; i++)
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                timeWidget(listCounter),
                              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                    itemsPerOrder[i], (index) {
                    if(listCounter<getCartHistoryList.length){
                      listCounter++;
                    }
                    return index<=2?Container(
                      padding: EdgeInsets.all(Dimensions.height5*7),
                     
                      margin: EdgeInsets.only(right: Dimensions.height5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                      image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!
                      ),
                      ),
                      
                      ),
                     ):Container();
                  }),
                  ), 
               
                 SizedBox(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    SmallText(text: "Total"),
                    BigText(text: "${itemsPerOrder[i]} Items" , color: AppColors.mainBlackColor,),
                    
                    GestureDetector(
                      onTap: (){
                        var orderItem = cartOrderTimeToList();
                        Map<int,CartModel> moreOrder = {};
                        for(int j=0; j<getCartHistoryList.length; j++){
                          if(getCartHistoryList[j].time == orderItem[i]){
                          moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => 
                          CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                          ); 
                            
                          }
                        }
                        Get.find<CartController>().setItems=moreOrder;
                        Get.find<CartController>().addToCartList();
                        Get.toNamed(RouteHelpers.getCartPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                        border: Border.all(width: 1, color: AppColors.mainColor)),
                        
                      child: SmallText(text: "one more", color: AppColors.mainColor,),),
                    )
        
                  ]),
                 ) 
                ],)
              ],),)
              
            ]),
          ),
        ):Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height/1.5,
          child: const  Center(child: NoDataPage(text: "You don't buy anything so far!", imagePath: "assets/images/empty.png")));
        },)
      ],)
    );
  }
}