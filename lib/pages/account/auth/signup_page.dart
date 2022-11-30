import 'package:e_commerce_app/base/custom_loader.dart';
import 'package:e_commerce_app/base/show_custom_snackbar.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/models/signup_body_model.dart';
import 'package:e_commerce_app/pages/account/auth/signin_page.dart';
import 'package:e_commerce_app/routes/route_helpers.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/app_text_field.dart';
import 'package:e_commerce_app/widget/big_text.dart';
import 'package:e_commerce_app/widget/rich_text_tap.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
 var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void _registration(AuthController authController){
   String name = nameController.text.trim();
   String phone = phoneController.text.trim();
   String email = emailController.text.trim();
   String password = passwordController.text.trim();

    if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
    }else if(phone.isEmpty){
      showCustomSnackBar("Type in your phone number ", title: "Phone number ");
    
    } else if(email.isEmpty){
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
       SignUpBody signUpBody = SignUpBody(name: name,
       phone: phone, 
       email: email, 
       password: password);
       authController.registration(signUpBody).then((status){
        if(status.isSuccess){
          print("Success registration");
          Get.offNamed(RouteHelpers.getInitial());
        }else{
          showCustomSnackBar(status.message);
        }
       });

       print(signUpBody.toString());
    }

  }
    
    
    var SignupImages = [
    "twitter.png",
    "facebook.png",
    "google.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children:  [
          SizedBox(height: Dimensions.height30,),
           const Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/logo.png"),
            radius: 80,
            ),
          ),
           
           // email
           AppTextField(textController: emailController, hintText: "Email", icon: Icons.email), 
          
           //password
           AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_rounded, isObscure: true,), 
          
           //Name
           AppTextField(textController: nameController, hintText: "Name", icon: Icons.person), 
           //phone
           AppTextField(textController: phoneController, hintText: "Phone", icon: Icons.phone_android), 
          
           
           SizedBox(height: Dimensions.height10,),
      
           GestureDetector(
            onTap: (){
               _registration(_authController);
            },
             child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30, vertical: Dimensions.height15),
              decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(Dimensions.radius20)
             ),
             child: BigText(text: "Signup", color: Colors.white),
             ),
           ),
            
             SizedBox(height: Dimensions.height15,),
             RichTextTap(text: "Have an account already? ", linktext: "Login",size: Dimensions.font20,
              recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SigninPage(), transition: Transition.fade)
             ),
             SizedBox(height: Dimensions.height5*5),
             // signup options
             RichText(text: TextSpan(text: "Sign up using one of the following method", style: TextStyle(color: Colors.grey[600], fontSize: Dimensions.font16)),
             ),
            
            SizedBox(height: Dimensions.height20),
            Wrap(
              spacing: Dimensions.width10,
              children: 
              List.generate(3, (index) => CircleAvatar(
              radius: Dimensions.radius20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/${SignupImages[index]}"),
              ),
              ),
             ), 
            ],
          ),
        ):const CustomLoader();
     
      },) );
    }
}