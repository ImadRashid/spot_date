import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotadate/core/constants/colors.dart';
import 'package:spotadate/ui/custom_widgets/messages_screens_app_bar.dart';
import 'package:spotadate/ui/screens/upload_images/upload_image_model.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: messagesScreenAppBar(
        title: 'Upload Photo',
        color: appBarGreyColor,
        leading: Icons.arrow_back,
        leadingOnpress: () => Navigator.pop(context),
        trailing: Container()
      ),
      body: Consumer<UploadViewModel>(
        builder: (context, model, child) => Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height*0.15,),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: GridView.builder(
                  shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: appBarGreyColor,width: 2)
                          ),
                          /// Show icon button ... Before image taken
                          ///
                          child: model.uploadImages[index].image == null ? IconButton(
                            icon: Icon(Icons.add,color: orangeColor, size: 60,),
                            onPressed: (){
                              model.takeImage(index);
                            },
                          ) :
                          /// Show image .... After taking from gallery
                          ///
                          Stack(
                            children: [
                              Image.file(model.uploadImages[index].image,fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  icon: model.uploadImages[index].isFilled ? Icon(Icons.star, color: Color(0xFFFDC800),size: 30,) :
                                  Icon(Icons.star_border,color: Colors.white,size: 30,),
                                  onPressed: (){
                                    model.changeColor(index);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              /// save button
              ///
              Container(
                height: 31,
                decoration: BoxDecoration(
                  color: model.count > 0 ? disableColor : orangeColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: FlatButton(
                  child: Text('Save',
                    style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w500),),
                  onPressed: null,
                ),
              ),
            ],
          )
        )
      )
    );
  }
}

