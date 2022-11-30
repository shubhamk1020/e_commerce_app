import 'dart:async';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';


    class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    
    @override
    State<SplashScreen> createState() => _SplashScreenState();

    }

    class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

    late Animation<double> animation;
    late AnimationController controller;

    _loadedProducts(){
      Get.find<PopularProductController>().getPopularProductList();
        Get.find<RecommendedProductController>().getRecommendedProductList();
    }

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, 
    duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    _loadedProducts();

   Timer(
   const Duration(seconds: 3),
    ()=> Get.offNamed(RouteHelpers.getInitial()),
    );
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ScaleTransition(scale: animation,
          child: Center(
            child: SizedBox(
              height: Dimensions.imageheight,
              width: Dimensions.imagewidth,
              child: Image.asset("assets/images/logo.png")),
          ),
        ),
       Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height10*5,),
        child: Image.asset("assets/images/the.png", fit:BoxFit.cover,))
      ],)
    );
    }
  }