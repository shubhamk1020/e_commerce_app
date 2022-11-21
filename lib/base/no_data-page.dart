
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
   final String text;
    final String imagePath;

  const NoDataPage({super.key, required this.text, this.imagePath="assets/images/shopping.png"});


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
          width: double.maxFinite,
         padding: EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 200),
          margin: EdgeInsets.all(Dimensions.height20),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.contain),
         
          // height: MediaQuery.of(context).size.height*0.22,
          // width: MediaQuery.of(context).size.width*0.22,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Text(text, style: TextStyle(fontSize: Dimensions.font16,
        color: Theme.of(context).disabledColor
        ),
      textAlign: TextAlign.center,
        )
      ],),
    );
  }
}