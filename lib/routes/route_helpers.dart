
import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/pages/home/home_page.dart';
import 'package:e_commerce_app/pages/food/popular_food_details.dart';
import 'package:e_commerce_app/pages/food/recomended_food_details.dart';
import 'package:e_commerce_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';


class RouteHelpers{
  static const String splashScreen = "/splash_screen";
  static const String initial = "/";
  static const String popularFood = "/popular-Food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCart()=> '$cartPage';


  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: ()=> SplashScreen()),

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