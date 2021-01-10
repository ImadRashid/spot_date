import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';


Widget messagesScreenAppBar({title, color, leading, leadingOnpress, trailing}){
  return AppBar(
    backgroundColor: Color(0xFFF9F9F9),
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(leading,color: orangeColor,size: 30,),
      onPressed: leadingOnpress,
    ),
    title: Text(title,style: TextStyle(color: color,fontSize: 18),),
    centerTitle: true,
    actions: [
      trailing
    ],
  );
}
