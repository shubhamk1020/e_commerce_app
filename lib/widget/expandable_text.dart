import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimension.dart';
import 'package:e_commerce_app/widget/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});
 

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
      
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(
        size: Dimensions.font16,
        color: AppColors.pageColor, text: firstHalf):Column(
        children: [
          SmallText(
            size: Dimensions.font16,
            color: AppColors.pageColor,
            height: 1.5,
            text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(onTap: () {
            setState(() {
              hiddenText = !hiddenText;
            });
          },
          child: Row(children: [
            SmallText(text: hiddenText ? "show more" : "show less" , color: AppColors.mainColor,),
            SizedBox(width: Dimensions.width5,),
            Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,  color: AppColors.mainColor),

          ],),
          )
        ],
      ),
    );
  }
}