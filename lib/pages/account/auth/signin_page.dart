import 'package:e_commerce_app/base/custom_loader.dart';
import 'package:e_commerce_app/pages/account/auth/signup_page.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_text_field.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/rich_text_tap.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/show_custom_snackbar.dart';
import '../../../controllers/auth_controller.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(AuthController authController){
   String email = emailController.text.trim();
   String password = passwordController.text.trim();

   if(email.isEmpty){
      showCustomSnackBar("Type in your email address", title: "Email address");
    }
    else if(!GetUtils.isEmail(email)){
    showCustomSnackBar("Type in a valid email address", title: "Valid email address");
    }
    else if(password.isEmpty){
      showCustomSnackBar("Type in your password", title: "Password");
    }else if(password.length<6){
      showCustomSnackBar("Pasword can't be less than six characters", title: "Password");
    }else{
     
       authController.login(email, password).then((status){
        if(status.isSuccess){
         Get.toNamed(RouteHelpers.getInitial());
         
        }else{
          showCustomSnackBar(status.message);
        }
       });
      }
      }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading ? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children:  [
          SizedBox(height: Dimensions.height20,),
           const Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/logo.png"),
            radius: 80,
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width10*2),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello", style: TextStyle(color: Colors.black, fontSize: Dimensions.height15*5, fontFamily: "Roboto"),),
                
                BigText(text: "Sign into your account", color: Colors.grey[500], size: Dimensions.font20,),
                SizedBox(height: Dimensions.height15,),
              ],
            ),),

           // email
           AppTextField(textController: emailController, hintText: "Email", icon: Icons.email), 
           //password
           AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_rounded, isObscure: true,), 
                      
           SizedBox(height: Dimensions.height10,),

           Row(children: [
           Expanded(child: Container()),
           BigText(text: "Sign into your account", color: Colors.grey[500], size: Dimensions.font20,),
           SizedBox(width: Dimensions.width20),
           ],),
           SizedBox(height: Dimensions.height30,),
      
           GestureDetector(
            onTap: (){
             _login(authController);
            },
             child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30, vertical: Dimensions.height15),
              decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(Dimensions.radius20)
             ),
             child: BigText(text: "Signin", color: Colors.white),
             ),
           ),

          
             SizedBox(height: Dimensions.height30,),
             RichTextTap(text: "Don't have an account? ", linktext: " Create",
             size: Dimensions.font20, 
             recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignupPage(),
             transition: Transition.fade
             )
             ),
            
             SizedBox(height: Dimensions.height5*5),
             // signup options
                       
            SizedBox(height: Dimensions.height20),
           ],
        ),
      ): const CustomLoader();
    
      },)
    );
  }
}