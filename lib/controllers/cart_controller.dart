import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

      Map<int, CartModel> _items={};

      Map<int, CartModel> get items => _items;

      List<CartModel> storageItems=[];
      
      void addItem(ProductModel product, int quantity){
        var totalQuantity = 0;

        if(_items.containsKey(product.id!)){
        _items.update(product.id!, (value) {

          totalQuantity = value.quantity! + quantity;
          
          return CartModel(
          id: value.id,
          name: value.name,
          img: value.img,
          price: value.price,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product
        );
        }); 
        if(totalQuantity<=0){
          _items.remove(product.id);

        }
        } else{
            if(quantity>0){
              _items.putIfAbsent(product.id!, () { 
          return CartModel(
          id: product.id,
          name: product.name,
          img: product.img,
          price: product.price,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product
        );
        });

            }
            else{
              Get.snackbar("Item count", "You should at least add an item in the cart!", 
          backgroundColor: AppColors.mainColor,
            colorText: Colors.white
            );
            }
        }

        cartRepo.addToCartList(getItems);
        update();

      }

          bool existInCart(ProductModel product){
          if(_items.containsKey(product.id)){
            return true;
          }
          else{
            return false;
          }
        }

          int getQuantity(ProductModel product){
        var quantity =0;  
        if(_items.containsKey(product.id)){
          _items.forEach((key, value) {
            if(key==product.id){
              quantity = value.quantity!; 
            }
          });
        }
        return quantity;
      }
        
          int get totalItems{
          var totalQuantity = 0;
          _items.forEach((key, value) {
          totalQuantity = totalQuantity + value.quantity!;
          });
          return totalQuantity;
        }

          List<CartModel> get getItems{
          return _items.entries.map((e) {
              return e.value;
            }).toList();
      }

         int get totalAmount{
          var total = 0;
          _items.forEach((key, value) {
            total += value.quantity! * value.price!*74;
          });

          return total;
         }

        List<CartModel> getCartData(){
          setCart = cartRepo.getCartList();
          return storageItems;
        }

        set setCart(List<CartModel> items){
          
          storageItems = items;
          
          for(int i=0; i<storageItems.length; i++){
            _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
          
          }
        }
    }