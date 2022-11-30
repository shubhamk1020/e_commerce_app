import 'package:e_commerce_app/base/custom_loader.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/user_controller.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/account_widget.dart';
import 'package:e_commerce_app/widget/app_icon.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoginIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoginIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(title: Center(child: BigText(text: "Profile",color: Colors.white, size: Dimensions.font26,)),
      backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoginIn?(userController.isLoading ? 
        Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: Dimensions.height20) ,
        child: Column(children: [
          AppIcon(icon: (Icons.person), size: Dimensions.height15*10, iconColor: Colors.white,backgroundColor: AppColors.mainColor,iconSize: Dimensions.height15*5,),
          SizedBox(height: Dimensions.height20,),  
          
         Expanded(
           child: SingleChildScrollView(
             child: Padding(
              padding: EdgeInsets.only(left:Dimensions.width10, right: Dimensions.width10,),
               child: Column(children: [
                 AccountWidget(appIcon: AppIcon(icon: Icons.person,size: Dimensions.height10*5, 
                 backgroundColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                bigText: BigText(text: userController.userModel.name,)),
                SizedBox(height: Dimensions.height10,),  
                        
                AccountWidget(appIcon: AppIcon(icon: Icons.phone,size: Dimensions.height10*5, backgroundColor: AppColors.yellowColor, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                bigText: BigText(text: userController.userModel.phone,)),
                SizedBox(height: Dimensions.height10,),
                        
                AccountWidget(appIcon: AppIcon(icon: Icons.email_sharp,size: Dimensions.height10*5, backgroundColor: AppColors.yellowColor, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                bigText: BigText(text: userController.userModel.email,)),
                SizedBox(height: Dimensions.height10,),
                        
                AccountWidget(appIcon: AppIcon(icon: Icons.location_on,size: Dimensions.height10*5, backgroundColor: AppColors.yellowColor, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                bigText: BigText(text: "Fill in your address",)),
                SizedBox(height: Dimensions.height10,),
                        
                AccountWidget(appIcon: AppIcon(icon: Icons.message_rounded,size: Dimensions.height10*5, backgroundColor: Colors.redAccent, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                bigText: BigText(text: "Message",)),
                SizedBox(height: Dimensions.height10,),

                GestureDetector(
                  onTap: (){
                    if(Get.find<AuthController>().userLoggedIn()){
                    Get.find<AuthController>().clearSharedData();
                    Get.find<CartController>().clear();
                    Get.find<CartController>().clearCartHistory();
                    Get.offNamed(RouteHelpers.getSignInPage());
                    }
                    else{
                      print("you logged out");
                    }
                  },
                  child: AccountWidget(appIcon: AppIcon(icon: Icons.logout_rounded,size: Dimensions.height10*5, backgroundColor: Colors.redAccent, iconColor: Colors.white, iconSize: Dimensions.height5*5,),
                  bigText: BigText(text: "Logout",)),
                ),
                SizedBox(height: Dimensions.height10,),
                        
               ],),
             ),
           ),
         )
        ]),
      ):const CustomLoader()):
     
      GestureDetector(
        onTap: (){
        Get.toNamed(RouteHelpers.getSignInPage());
        },
        child: Container(
        color: Colors.white,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: Dimensions.height30*10,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/lock.jpg"), fit: BoxFit.contain)),),
      
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, ),
              height: Dimensions.height20*4,
              width: Dimensions.width40*10,             
             // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: "Sign in", size: Dimensions.font26, color: Colors.white,),
                  SizedBox(width: Dimensions.width10,),
                  const Icon(Icons.login_rounded, color: Colors.white,)
              ],)
      
             ),
            ],
           )),
      );
        
        
      },)
    );

  }
}