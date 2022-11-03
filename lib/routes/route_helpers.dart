
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/pages/popular_food_details.dart';
import 'package:e_commerce_app/pages/recomended_food_details.dart';
import 'package:get/get.dart';


class RouteHelpers{
  static const String initial = "/";
  static const String popularFood = "/popular-Food";
  static const String recommendedFood ="/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood() => '$recommendedFood';


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      return RecommendedFoodDetails();
    },
    transition: Transition.fadeIn
    )
  ];
}