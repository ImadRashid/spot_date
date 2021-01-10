
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotadate/ui/screens/date_arrival_screen.dart';
import 'package:spotadate/utils/colors.dart';

class DateConfirmedDialog {

  DateConfirmedDialog({this.context, this.onDismiss});

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
              buildCrossBtn(),
              SizedBox(height: 10,),
              buildDescription(),
              SizedBox(height: 10,),
              buildLogo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCrossBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
            //onDismiss();
            Navigator.push(context, MaterialPageRoute(builder:(context)=>DateArrivalScreen(

            )));
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
    return Text(
      "Date Confirmed!",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  // build logo
  Widget buildLogo() {
    return SvgPicture.asset(
      'assets/images/heartsplash.svg',
      width: 80,
      height: 80,
    );
  }
}
