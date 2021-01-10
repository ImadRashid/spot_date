






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotadate/utils/colors.dart';

class ResquestAcceptionDialog {

  ResquestAcceptionDialog({this.context, this.onDismiss});

  Function onDismiss;

  BuildContext context;

  // show dialog
  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Container(
          //width: 150,
          height: 150,
          //padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //buildCrossBtn(),
              //SizedBox(height: 10,),
              buildDescription(),
              SizedBox(height: 10,),
              buildVerifyBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVerifyBtn() {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SpotVerificationPage()));
            },
            color: orangeColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Verify",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      SizedBox(width: 10,),
        Expanded(
          child: MaterialButton(
            onPressed: ()
            {

            },
            // isVerifyBtnEnabled? () {
            //   setState(() {
            //     isDeclineBtnEnabled = false;
            //   });
            //   declineRequest();
            // } : null,
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(width: 1, color: orangeColor),
            ),
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 14.0, color: orangeColor, fontFamily: 'Lato', fontWeight: FontWeight.bold),
            ),
          ),
        )

      ],
    );
  }

  Widget buildCrossBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
            onDismiss();
          },
          child: Icon(
            Icons.clear,
            color: orangeColor,
            size: 16,
          ),
        ),
      ],
    );
  }

  // description
  Widget buildDescription() {

    return Row(
      children: [
      SvgPicture.asset(
      'assets/images/heartsplash.svg',
      width: 30,
      height: 30,
    ),
    Text(
    " Request spot verification?",
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
    ),

      ],
    );
  }

  // build logo
  Widget buildLogo() {
    return Icon(
      Icons.favorite,
      color: orangeColor,
      size: 60,
    );
  }
}
