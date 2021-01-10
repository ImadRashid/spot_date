import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadImage{
  File image;
  bool isFilled;
  UploadImage({this.image,this.isFilled});
}


class UploadViewModel extends ChangeNotifier{
  int count = 4;
  List<UploadImage> uploadImages = [
    UploadImage(image: null, isFilled: false),
    UploadImage(image: null, isFilled: false),
    UploadImage(image: null, isFilled: false),
    UploadImage(image: null, isFilled: false),
  ];

  void takeImage(int index) async{
    final pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      uploadImages[index].image = File(pickedImage.path);
      count -=1;
      notifyListeners();
    }else{
      print('image not taken');
    }
  }

  void changeColor(int index){
    uploadImages[index].isFilled = uploadImages[index].isFilled == false ? true : false;
    notifyListeners();
  }
}