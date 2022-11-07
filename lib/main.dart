import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/depedency.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PopularProductController>(builder: (_){
        return GetBuilder<RecommendedProductController>(builder: (_){
         return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
       
       
       initialRoute: RouteHelpers.getSplashScreen(),
       getPages: RouteHelpers.routes,
         
       );
        
        });
    },
      
    );
  }
}

