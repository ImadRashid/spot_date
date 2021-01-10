import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';

class RateExperience{
  Widget icon;
  bool isFilled;

  RateExperience({this.icon, this.isFilled});
}

class RateExperienceModel extends ChangeNotifier{

  List<RateExperience> rateList = [
    RateExperience(
      icon: Icon(Icons.star, color: Colors.white, size: 30,),
      isFilled: false
    ),
    RateExperience(
        icon: Icon(Icons.star, color: Colors.white, size: 30,),
        isFilled: false
    ),
    RateExperience(
        icon: Icon(Icons.star, color: Colors.white, size: 30,),
        isFilled: false
    ),
    RateExperience(
        icon: Icon(Icons.star, color: Colors.white, size: 30,),
        isFilled: false
    ),
    RateExperience(
        icon: Icon(Icons.star, color: Colors.white, size: 30,),
        isFilled: false
    ),
  ];
  void rateExperience(int index){
    if(rateList[index].isFilled == false){
      for(int i=0;i<=index;i++){
        rateList[i].isFilled = true;
        rateList[i].icon = Icon(Icons.star, color: yellowColor, size: 30);
        notifyListeners();
      }
    }else{
      for(int i=index+1;i<5;i++){
        rateList[i].isFilled = false;
        rateList[i].icon = Icon(Icons.star, color: Colors.white, size: 30);
        notifyListeners();
      }
    }
  }
}