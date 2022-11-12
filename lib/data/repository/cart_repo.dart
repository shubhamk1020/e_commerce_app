import 'dart:convert';

import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

  class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];

  void addToCartList(List<CartModel> cartList){
    cart = [];
   
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
  }

      List<CartModel> getCartList(){

        List<String> carts = [];
        if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
        carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;

        }
        List<CartModel> cartList = [];

        carts.forEach((element) =>
          cartList.add(CartModel.fromJson(jsonDecode(element)))
        );
        return cartList;
      }


      List<CartModel> getCartHistoryList(){
        if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
          cartHistory = [];
          cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
        }
        List<CartModel> cartListHistory = [];
        cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
        return getCartHistoryList();

      }
  
    void addToCartHistory(){
      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;

      }
      
      for(int i=0; i<cart.length; i++){
        cartHistory.add(cart[i]);
        removeCart();
        sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
        

      }
      }

      void removeCart(){
      sharedPreferences.remove(AppConstants.CART_LIST);
      }

}