import 'package:flutter/material.dart';
import 'package:spotadate/core/constants/colors.dart';

class ShareNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          ///
          Container(
            color: Colors.grey[600],
            child: Opacity(
              opacity: 0.3,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/share_number/background_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          /// Center text plus Profile image..... With two buttons
          ///
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/share_number/profile_image.png'),
                SizedBox(height: 20,),
                Text('Hi, Emma \n would you like to share \n your number with Chad?',
                  style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                // =========>>>> buttons row here <<<<======== //
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      customCircularButton(text: 'Send Number', borderColor: Colors.transparent, buttonColor: orangeColor),
                      SizedBox(width: 20,),
                      customCircularButton(text: 'Umm, No', borderColor: Colors.white, buttonColor: Colors.transparent)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customCircularButton({String text, Function onPressed, borderColor, buttonColor}){
    return Expanded(
        child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: buttonColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(30)
            ),
            child: FlatButton(
              child: Text(text,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
              onPressed: onPressed,
            )
        )
    );
  }
}
