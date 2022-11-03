import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';



Future<void> init() async{

//Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//Repose
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
 

//controllers 
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
 
}