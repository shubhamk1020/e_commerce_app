
import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/popular_food_details.dart';
import 'package:e_commerce_app/pages/recomended_food_details.dart';
import 'package:get/get.dart';


class RouteHelpers{
  static const String initial = "/";
  static const String popularFood = "/popular-Food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCart()=> '$cartPage';


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
       var pageId = Get.parameters['pageId'];
       var page = Get.parameters['page'];
      return RecommendedFoodDetails(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),

   GetPage(name: cartPage, page: (){
    return CartPage();
   })
  ];
}