import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_column.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/icon_and_text_widget.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

    @override
  void dispose() {
      pageController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded ? SizedBox(
          height: Dimensions.pageView,
                  
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, index) {
              return _buildPageItem(index, popularProducts.popularProductList[index]);
            }),
          
    ) : CircularProgressIndicator(color: AppColors.mainColor,);
        }),

    GetBuilder<PopularProductController>(builder: (popularProducts){
        return  DotsIndicator(
    dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
    position: _currentPageValue,
    decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      );
    }),
   
      SizedBox(height: Dimensions.height15,),

      Container(
         margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          BigText(text: "Recommended"),
          SizedBox(width: Dimensions.width5,),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: SmallText(text: ".")),
            SizedBox(width: Dimensions.width5,),
             Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(text: "food pairing")
         ),
        ],
        ),
      ),
     
      SizedBox(height: Dimensions.height10),

      GetBuilder<RecommendedProductController>(builder: (recommendedProducts){
        return recommendedProducts.isLoaded ? ListView.builder(
          
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recommendedProducts.recommendedProductList.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelpers.getRecommendedFood(index, "cart_page"));
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30)),
              margin: EdgeInsets.only(left: Dimensions.width15, 
              right: Dimensions.width15, 
              bottom: Dimensions.height5),
                child: Row(children: [
                  Container(
            height: Dimensions.listViewImageSize,
            width: Dimensions.listViewImageSize,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: Colors.white38,
             image:  DecorationImage(
              image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL  +recommendedProducts.recommendedProductList[index].img!), fit: BoxFit.cover),
             ),
                   ),
                   Expanded(
             child: Container(
              height: Dimensions.listViewTextSize,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radius20), 
              topRight: Radius.circular(Dimensions.radius20)),
              color: Colors.white,),
               child: Padding(
                 padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    BigText(text: recommendedProducts.recommendedProductList[index].name!,),
                    SizedBox(height: Dimensions.height10,),
                    SmallText(text: "small text"),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      IconAndText(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                      IconAndText(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor),
                      IconAndText(icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.iconColor2),
                    ],)
                  ],
                 ),
               ),
             ),
                   )
          
              ]),
          
            ),
          );
        }): CircularProgressIndicator(color: AppColors.mainColor,);
      

      }),
          ],
     );
  }
  
Widget _buildPageItem(int index, ProductModel popularProduct) {
  Matrix4 matrix = new Matrix4.identity();

  if(index == _currentPageValue.floor()){
    var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
    var currTrasn = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrasn, 0);
  }
  else if(index == _currentPageValue.floor() + 1){
    var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
     var currTrasn = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrasn, 0);
  }
  else if(index == _currentPageValue.floor() - 1){
   var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
     var currTrasn = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrasn, 0);
  }
  else{
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-currScale)/2, 1);
  }

  return Transform(
    transform: matrix,
    child: Stack(
      children: [
      GestureDetector(
         onTap: () {
             Get.toNamed(RouteHelpers.getPopularFood(index, "home")); 
            },
        child: Container(
        height: Dimensions.pageViewContainer,
        margin:  EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),
        image: DecorationImage(
        image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!), fit: BoxFit.cover)
        ),
        
          ),
      ),
  
     Align(
      alignment: Alignment.bottomCenter,
       child: Container(
        height: Dimensions.pageViewTextContainer,
        margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30,bottom: Dimensions.height30),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Colors.white,
        boxShadow: const[
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5,
              offset: Offset(0,5)
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5,0)
            ),
            BoxShadow(
            color: Colors.white,
            offset: Offset(5,0)
            )
        ]
          ),
          
         child: Container(
        padding: EdgeInsets.only(left: Dimensions.width15 ,right: Dimensions.width15, top: Dimensions.height15),
        child: AppColumn(text: popularProduct.name!) )
       ),
    
      ),
     
    ],
    ),
  );
  }

}